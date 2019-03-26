library(glmmBUGS)


### Name: checkChain
### Title: Plot an MCMC run
### Aliases: checkChain

### ** Examples

thechain = list(beta = array(1, c(10, 3,4), 
dimnames = list(NULL, NULL, paste("beta[", 1:4, "]", sep=""))),
 intercept = matrix(1, 10, 3))

checkChain(thechain)




