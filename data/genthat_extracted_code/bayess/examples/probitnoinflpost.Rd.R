library(bayess)


### Name: probitnoinflpost
### Title: Log of the posterior density for the probit model under a
###   non-informative model
### Aliases: probitnoinflpost
### Keywords: probit model generalised linear model non-informative prior

### ** Examples

data(bank)
y=bank[,5]
X=as.matrix(bank[,-5])
probitnoinflpost(runif(4),y,X)



