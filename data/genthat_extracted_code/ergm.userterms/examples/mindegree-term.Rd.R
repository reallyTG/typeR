library(ergm.userterms)


### Name: mindegree-term
### Title: New Minimum Degree Term for the 'ergm' Package
### Aliases: mindegree ergm-terms InitErgmTerm.mindegree
### Keywords: models

### ** Examples

## No test: 
data(florentine)
summary(flomarriage~mindegree(3))
summary(flomarriage~mindegree(1,by="priorates"))
fit <- ergm(flomarriage~edges+mindegree(1,by="priorates"))
summary(fit)
## End(No test)



