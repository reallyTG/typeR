library(MplusAutomation)


### Name: extract
### Title: Extract function to make Mplus output work with the 'texreg'
###   package
### Aliases: extract extract.mplus.model extract.mplusObject
###   extract,mplus.model-method extract,mplusObject-method
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
##D extract(res$results)
##D # there is also a method for mplusObject class
##D extract(res)
##D 
##D # load the texreg package
##D # to use pretty printing via screenreg
##D # uncomment to run these examples
##D # library(texreg)
##D # screenreg(res)
##D # screenreg(res, type = 'stdyx')
##D 
##D # screenreg(res, type = 'un', params = 'regression',
##D #   single.row=TRUE)
##D # screenreg(res, type = 'un', params = 'regression', summaries = 'CFI',
##D #   single.row=TRUE)
##D 
##D # remove files
##D unlink("mtcars.dat")
##D unlink("model1.inp")
##D unlink("model1.out")
##D unlink("Mplus Run Models.log")
## End(Not run)



