library(pairwise)


### Name: andersentest.pers
### Title: Andersen's Likelihood Ratio Test for Object of class "pers"
### Aliases: andersentest.pers

### ** Examples

## Not run: 
##D data(bfiN) # loading example data set
##D data(bfi_cov) # loading covariates to bfiN data set
##D model <- pers(pair(bfiN,m=6))
##D andersentest.pers(model, split = bfi_cov$gender)
##D andersentest.pers(model, split = "random")
##D andersentest.pers(model, split = "median")
##D ### unsing simulated data:
##D data("sim200x3")
##D model2 <- pers(pair(sim200x3))
##D andersentest.pers(model2, split = "median")
## End(Not run)



