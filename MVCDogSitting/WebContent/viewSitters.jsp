<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css">
<link rel="stylesheet" type="text/css" href="rating.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Sitters</title>
</head>
<body>
<section class="navbar">
<div class="grid-row row">
<c:if test="${sessionScope.user.userName == null}">
<div class="col"><a class="button" href="welcomePage.do">Home</a></div>
<div class="col"><a class="button" href="loginPage.do">Login</a></div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>
 
 <c:if test="${sessionScope.user.userName != null}">
<div class="col"><a class="button" href="welcomePage.do">Home</a></div>
<div class="col"><a class="button" href="logout.do">Logout</a></div>
 <div class="col">Hi ${sessionScope.user.contact.firstName}!</div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>
  </div>
</section>
	<c:forEach var="sitter" items="${sitters}">
		<p>${sitter.user.contact.firstName}
			${sitter.user.contact.lastName}</p>
		<p>${sitter.user.contact.street}${sitter.user.contact.city},
			${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
		<form action="setAppointment.do">
			<input type="hidden" value="${sitter.id}" name="sitterId" /> <input
				type="submit" value="Set Appointment" />
		</form>
		<form action="setRating.do" method="POST">
			<fieldset class="rating">
				<input type="radio" id="star5" name="rating" value="5" /><label
					class="full" for="star5" title="Awesome - 5 stars"></label> <input
					type="radio" id="star4half" name="rating" value="4.5" /><label
					class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rating" value="4" /><label
					class="full" for="star4" title="Pretty good - 4 stars"></label> <input
					type="radio" id="star3half" name="rating" value="3.5" /><label
					class="half" for="star3half" title="Meh - 3.5 stars"></label> <input
					type="radio" id="star3" name="rating" value="3" /><label
					class="full" for="star3" title="Meh - 3 stars"></label> <input
					type="radio" id="star2half" name="rating" value="2.5" /><label
					class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rating" value="2" /><label
					class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
					type="radio" id="star1half" name="rating" value="1 and a half" /><label
					class="half" for="star1half" title="Meh - 1.5 stars"></label> <input
					type="radio" id="star1" name="rating" value="1" /><label
					class="full" for="star1" title="Sucks big time - 1 star"></label> <input
					type="radio" id="starhalf" name="rating" value="0.5" /><label
					class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			</fieldset>
			<input type="hidden" value="${sitter.id}" name="sitterId" /> <input
				type="submit" value="Rate Sitter" />
		</form>
		<br>
		<hr>
	</c:forEach>

</body>
</html>