library(bayess)


### Name: logitnoinflpost
### Title: Log of the posterior distribution for the probit model under a
###   noninformative prior
### Aliases: logitnoinflpost
### Keywords: logit model generalised linear model noninformative prior

### ** Examples

data(bank)
y=bank[,5]
X=as.matrix(bank[,-5])
logitnoinflpost(runif(4),y,X)



