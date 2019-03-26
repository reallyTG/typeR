library(Rchoice)


### Name: cov.Rchoice
### Title: Functions for correlated random parameters
### Aliases: cor.Rchoice cov.Rchoice se.cov.Rchoice

### ** Examples

## Not run: 
##D ## Estimate a poisson model with correlated random parameters
##D data("Articles")
##D poissonc.ran <- Rchoice(art ~ fem + mar + kid5 + phd + ment, 
##D                        data = Articles, 
##D                        ranp = c(kid5 = "n", phd = "n", ment = "n"), 
##D                        family = poisson, 
##D                        correlation =  TRUE)
##D                        
##D ## Functions for models with correlated random parameters 
##D cov.Rchoice(poissonc.ran)
##D cor.Rchoice(poissonc.ran)
##D se.cov.Rchoice(poissonc.ran)
##D se.cov.Rchoice(poissonc.ran, sd = TRUE)                     
## End(Not run)



