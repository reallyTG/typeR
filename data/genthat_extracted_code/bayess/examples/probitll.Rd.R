library(bayess)


### Name: probitll
### Title: Log-likelihood of the probit model
### Aliases: probitll
### Keywords: probit model generalised linear model

### ** Examples

data(bank)
y=bank[,5]
X=as.matrix(bank[,-5])
probitll(runif(4),y,X)



