library(matchMulti)


### Name: matchMulti
### Title: A function that performs multilevel matching.
### Aliases: matchMulti

### ** Examples

	
#toy example with short runtime
library(matchMulti)

#Load Catholic school data
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
	
## Not run: 
##D #larger example
##D data(catholic_schools)
##D 
##D student.cov <- c('minority','female','ses')
##D 
##D # Check balance student balance before matching
##D balanceTable(catholic_schools[c(student.cov,'sector')],  treatment = 'sector')
##D 
##D #Match schools but not students within schools
##D match.simple <- matchMulti(catholic_schools, treatment = 'sector',
##D school.id = 'school', match.students = FALSE)
##D 
##D #Check balance after matching - this checks both student and school balance
##D balanceMulti(match.simple, student.cov = student.cov)
##D 
##D #Estimate treatment effect
##D output <- matchMultioutcome(match.simple, out.name = "mathach",
##D schl_id_name = "school",  treat.name = "sector")
##D 
##D # Perform sensitivity analysis using Rosenbaum bound -- increase Gamma to increase effect of
##D # possible hidden confounder          
##D matchMultisens(match.simple, out.name = "mathach",
##D           schl_id_name = "school", 
##D           treat.name = "sector", Gamma = 1.3)
##D           
##D 
##D # Now match both schools and students within schools          
##D match.out <- matchMulti(catholic_schools, treatment = 'sector',
##D school.id = 'school', match.students = TRUE, student.vars = student.cov)
##D 
##D # Check balance again
##D bal.tab <- balanceMulti(match.out, student.cov = student.cov)
##D 
##D # Now match with fine balance constraints on whether the school is large 
##D # or has a high percentage of minority students
##D match.fb <- matchMulti(catholic_schools, treatment = 'sector', school.id = 'school', 
##D match.students = TRUE, student.vars = student.cov, 
##D school.fb = list(c('size_large'),c('size_large','minority_mean_large')))
##D 
##D # Estimate treatment effects
##D matchMultioutcome(match.fb, out.name = "mathach", schl_id_name = "school",  treat.name = "sector")
##D 
##D #Check Balance
##D balanceMulti(match.fb, student.cov = student.cov)
##D 
## End(Not run)




