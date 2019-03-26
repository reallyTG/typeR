library(R2MLwiN)


### Name: jspmix1
### Title: Dataset of pupils' test scores, a subset of the Junior School
###   Project.
### Aliases: jspmix1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(jspmix1, package = "R2MLwiN")
##D 
##D jspmix1$denomb <- jspmix1$cons
##D 
##D (mymodel <- runMLwiN(c(english, probit(behaviour, denomb)) ~ 
##D   1 + sex + ravens + fluent[1] + (1 | school) + (1[1] | id), 
##D   D = c("Mixed", "Normal", "Binomial"), 
##D   estoptions = list(EstM = 1, mcmcMeth = list(fixM = 1, residM = 1, Lev1VarM = 1)), 
##D   data = jspmix1))
##D 
## End(Not run)



