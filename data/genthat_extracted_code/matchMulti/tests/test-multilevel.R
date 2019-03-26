library(matchMulti)
context("test-multilevel.R")

data(catholic_schools)
# Trim data to speed up example
catholic_schools <- catholic_schools[catholic_schools$female_mean >.45 &
 catholic_schools$female_mean < .60,]






#match on a single covariate 
student.cov <- c('minority')

match.simple <- matchMulti(catholic_schools, treatment = 'sector', 
                             school.id = 'school', match.students = FALSE, 
                             student.vars = student.cov, verbose=TRUE, tol=.01)

#Check balance after matching - this checks both student and school balance
balanceMulti(match.simple, student.cov = student.cov)




#match on several covariates
student.cov <- c('minority','female','ses')

# Check balance student balance before matching
balanceTable(catholic_schools[c(student.cov,'sector')],  treatment = 'sector')

#Match schools but not students within schools
match.simple <- matchMulti(catholic_schools, treatment = 'sector',
school.id = 'school', match.students = FALSE)



data <- catholic_schools
treatment = 'sector'
school.id = 'school'
match.students = FALSE
student.vars = NULL
school.caliper = NULL
school.fb = NULL
verbose = FALSE
keep.target = NULL
student.penalty.qtile = 0.05
min.keep.pctg = 0.8
school.penalty = NULL
save.first.stage = TRUE
tol = 1e-3



student.matches <- matchStudents(data, treatment, school.id, match.students, student.vars,  school.caliper, verbose, student.penalty.qtile, min.keep.pctg)

	school.match <- matchSchools(student.matches$schools.matrix, data, treatment, school.id, school.fb, school.penalty, verbose, tol = tol) 
	
	
dmat <- student.matches$schools.matrix
students <- catholic_schools
treatment = 'sector'
school.id = 'school'
school.fb = NULL
verbose = FALSE 
tol	<- 1e-3
penalty <- NULL
	
		out.match <- assembleMatch(student.matches$student.matches, school.match, school.id, treatment)
	


