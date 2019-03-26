library(MplusAutomation)


### Name: plot.mplusObject
### Title: Plot coefficients for an mplusObject
### Aliases: plot.mplusObject
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
##D # example of the coef method
##D plot(res)
##D 
##D # remove files
##D unlink("mtcars.dat")
##D unlink("model1.inp")
##D unlink("model1.out")
##D unlink("Mplus Run Models.log")
## End(Not run)



