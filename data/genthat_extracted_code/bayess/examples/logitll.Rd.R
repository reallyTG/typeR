library(bayess)


### Name: logitll
### Title: Log-likelihood of the logit model
### Aliases: logitll
### Keywords: logit model generalised linear model

### ** Examples

data(bank)
y=bank[,5]
X=as.matrix(bank[,-5])
logitll(runif(4),y,X)



