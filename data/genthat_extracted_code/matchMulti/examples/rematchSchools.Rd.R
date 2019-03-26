library(matchMulti)


### Name: rematchSchools
### Title: Repeat School Match Only
### Aliases: rematchSchools

### ** Examples

## Not run: 
##D # Load Catholic school data
##D data(catholic_schools)
##D 
##D student.cov <- c('minority','female','ses')
##D school.cov <- c('minority_mean','female_mean', 'ses_mean', 'size', 'acad')
##D 
##D #Match schools but not students within schools
##D match.simple <- matchMulti(catholic_schools, treatment = 'sector',
##D school.id = 'school', match.students = FALSE)
##D 
##D #Check balance after matching - this checks both student and school balance
##D balanceMulti(match.simple, student.cov = student.cov, school.cov = school.cov)
##D 
##D #now rematch excluding 2 schools
##D match.trimmed <- rematchSchools(match.simple, catholic_schools, keep.target = 13)
##D match.trimmed$dropped$schools.t
## End(Not run)



