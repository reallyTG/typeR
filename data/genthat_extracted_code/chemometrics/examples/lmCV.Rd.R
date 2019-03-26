library(chemometrics)


### Name: lmCV
### Title: Repeated Cross Validation for lm
### Aliases: lmCV
### Keywords: multivariate

### ** Examples

data(ash)
set.seed(100)
res=lmCV(SOT~.,data=ash,repl=10)
hist(res$SEP)



