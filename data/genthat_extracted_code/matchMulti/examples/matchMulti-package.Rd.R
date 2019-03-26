library(matchMulti)


### Name: matchMulti-package
### Title: Optimal Multilevel Matching using a Network Algorithm
### Keywords: matchMulti

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
##D          
##D matchMultisens(match.simple, out.name = "mathach",
##D           schl_id_name = "school", 
##D           treat.name = "sector", Gamma=1.3)
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
## End(Not run)



