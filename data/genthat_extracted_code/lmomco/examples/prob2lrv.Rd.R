library(lmomco)


### Name: prob2lrv
### Title: Convert a Vector of Annual Nonexceedance Probabilities to
###   Logistic Reduced Variates
### Aliases: prob2lrv
### Keywords: utility (probability)

### ** Examples

F <- nonexceeds()
lrv <- prob2lrv(F)
## Not run: 
##D X <- rlmomco(10040, vec2par(c(0,1,0), type="glo"))
##D plot(prob2lrv(pp(X, a=0.4)), sort(X)); abline(0,1)
## End(Not run)



