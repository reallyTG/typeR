library(peperr)


### Name: extract.fun
### Title: Extract functions, libraries and global variables to be loaded
###   onto a compute cluster
### Aliases: extract.fun
### Keywords: models regression survival

### ** Examples

# 1. Simplified example for illustration
## Not run: 
##D library(CoxBoost)
##D a <- function(){
##D # some calculation
##D }
##D 
##D b<-function(){
##D # some other calculation
##D x <- cv.CoxBoost()
##D # z is global variable
##D y <- a(z)
##D }
##D 
##D # list with packages, functions and variables required for b:
##D extract.fun(list(b))
##D 
##D # 2. As called by default in peperr example
##D extract.fun(list(fit.CoxBoost, aggregation.pmpec))
## End(Not run)



