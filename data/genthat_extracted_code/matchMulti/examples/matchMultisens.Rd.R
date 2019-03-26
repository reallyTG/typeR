library(matchMulti)


### Name: matchMultisens
### Title: Rosenbaum Bounds after Multilevel Matching
### Aliases: matchMultisens

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
##D           
## End(Not run)



