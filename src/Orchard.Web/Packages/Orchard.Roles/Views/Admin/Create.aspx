<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<RoleCreateViewModel>" %>
<%@ Import Namespace="Orchard.Roles.ViewModels"%>

<%@ Import Namespace="Orchard.Mvc.Html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add a Role</title>
    <% Html.Include("Head"); %>
</head>
<body>
    <% Html.Include("Header"); %>
    <% Html.BeginForm(); %>
    <%= Html.ValidationSummary() %>
                    <div class="yui-g">
						<h2 class="separator">Add a Role</h2>
						<h3>Information</h3>
						<label for="pageTitle">Role Name:</label>
						<input id="Name" class="inputText inputTextLarge" name="Name" type="text" value="<%= Model.Name %>" />
					
						<h3>Permissions</h3>
						<% foreach (var packageName in Model.PackagePermissions.Keys) { %>
						<h4><%= packageName %> Module</h4>
						<table id="pluginListTable" cellspacing="0" class="roundCorners clearLayout" >
							<colgroup>
								<col id="Permission" />
								<col id="Allow" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">Permission</th>
									<th scope="col">Allow</th>
								</tr>
							</thead>
							<% foreach (var permission in Model.PackagePermissions[packageName]) {%>
                            <tr>
								<td><%=permission.Description%></td>
								<td>
								    <input type="checkbox" value="true" name="<%="Checkbox." + permission.Name%>"/>
								</td>
							</tr>
							<% } %>
							</table>
							<% } %>
					       <input type="submit" class="button" value="Save" />
					</div>
	<% Html.EndForm(); %>
    <% Html.Include("Footer"); %>
</body>
</html>
