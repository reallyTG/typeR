library(bayess)


### Name: loglinnoinflpost
### Title: Log of the posterior density for the log-linear model under a
###   noninformative prior
### Aliases: loglinnoinflpost
### Keywords: log-linear model generalised linear model noninformative
###   prior

### ** Examples

X=matrix(rnorm(20*3),ncol=3)
beta=c(3,-2,1)
y=rpois(20,exp(X%*%beta))
loglinnoinflpost(beta, y, X) 



