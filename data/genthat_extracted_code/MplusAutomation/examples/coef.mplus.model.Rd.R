library(MplusAutomation)


### Name: coef.mplus.model
### Title: Return coefficients for an mplus.model object
### Aliases: coef.mplus.model coef.mplusObject
### Keywords: interface

### ** Examples

## Not run: 
##D # simple example of a model using builtin data
##D # demonstrates use
##D test <- mplusObject(
##D   TITLE = "test the MplusAutomation Package;",
##D   MODEL = "
##D     mpg ON wt hp;
##D     wt WITH hp;",
##D   OUTPUT = "STANDARDIZED;",
##D   usevariables = c("mpg", "wt", "hp"),
##D   rdata = mtcars)
##D 
##D res <- mplusModeler(test, "mtcars.dat", modelout = "model1.inp", run = 1L)
##D 
##D # example of the coef method on an mplud.model object
##D # note that res$results holds the results of readModels()
##D coef(res$results)
##D coef(res$results, type = "std")
##D coef(res$results, type = "stdy")
##D coef(res$results, type = "stdyx")
##D 
##D # there is also a method for mplusObject class
##D coef(res)
##D 
##D # remove files
##D unlink("mtcars.dat")
##D unlink("model1.inp")
##D unlink("model1.out")
##D unlink("Mplus Run Models.log")
## End(Not run)



