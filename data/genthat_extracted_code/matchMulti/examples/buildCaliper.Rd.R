library(matchMulti)


### Name: buildCaliper
### Title: Construct propensity score caliper
### Aliases: buildCaliper
### Keywords: balance

### ** Examples

	## Not run: 
##D # Load Catholic school data
##D data(catholic_schools)
##D 
##D student.cov <- c('minority','female','ses','mathach')
##D 
##D # Check balance student balance before matching
##D balanceTable(catholic_schools[c(student.cov,'sector')],  treatment = 'sector')
##D 
##D #fit a propensity score caliper on mean values of student covariates within schools
##D school.caliper <- buildCaliper(data = catholic_schools, treatment = 'sector',
##D 	ps.vars = student.cov, group.id = 'school')
##D 
##D #Match schools but not students within schools
##D match.simple <- matchMulti(catholic_schools, treatment = 'sector', 
##D 	school.caliper = school.caliper, school.id = 'school', match.students = FALSE)
##D 
##D #Check balance after matching - this checks both student and school balance
##D balanceMulti(match.simple, student.cov = student.cov)
## End(Not run)



