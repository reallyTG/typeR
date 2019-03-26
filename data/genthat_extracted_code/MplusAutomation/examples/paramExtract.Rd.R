library(MplusAutomation)


### Name: paramExtract
### Title: Extract parameters from a data frame of Mplus estimates
### Aliases: paramExtract
### Keywords: utils

### ** Examples

## Not run: 
##D   test <- mplusObject(
##D     TITLE = "test the MplusAutomation Package and my Wrapper;",
##D     MODEL = "
##D       mpg ON wt hp;
##D       wt WITH hp;",
##D     usevariables = c("mpg", "wt", "hp"),
##D     rdata = mtcars)
##D 
##D   res <- mplusModeler(test, "mtcars.dat", modelout = "model1.inp", run = 1L)
##D 
##D   # store just the unstandardized parameters in 'd'
##D   d <- res$results$parameters$unstandardized
##D   # extract just regression parameters
##D   paramExtract(d, "regression")
##D   # extract other types of parameters using shorthand
##D   paramExtract(d, "u")
##D   paramExtract(d, "e")
##D   paramExtract(d, "v")
## End(Not run)



