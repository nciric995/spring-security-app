<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"  %>

<html>
<head>
<title>Home page</title>


</head>

<body>



<h3>Home page</h3>
<hr>
<p>
Welcome to home page !
</p>

<hr>

<!-- Display user name and role -->
<p>

User : <security:authentication property="principal.username"/>
<br><br>
Role(s) : <security:authentication property="principal.authorities"/>

</p>

<hr>

<security:authorize access="hasRole('MODERATOR')">

<p>

	<a href="${pageContext.request.contextPath}/leaders">Moderator page</a>
	(For moderators only)

</p>

</security:authorize>

<br>

<security:authorize access="hasRole('ADMIN')">

<p>
	<a href="${pageContext.request.contextPath}/system">Admin page</a>
	(For admins only)
</p>

</security:authorize>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">

	
	<input type="submit" value="Logout"/> 

</form:form>


</body>

</html>