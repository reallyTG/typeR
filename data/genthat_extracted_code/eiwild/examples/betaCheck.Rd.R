library(eiwild)


### Name: betaCheck
### Title: betaCheck function
### Aliases: betaCheck

### ** Examples

## Not run: 
##D # right beta array
##D beta1 <- rep(c(0,0.25,0.75), each=3)
##D beta2 <- rep(beta1, 3)
##D betaRight <- array(beta2, dim=c(3,3,3))
##D betaCheck(betaRight, 3,3,3)
##D 
##D # wrong beta array
##D betaWrong <- array(1:27, dim=c(3,3,3))
##D betaCheck(betaWrong)
## End(Not run)



