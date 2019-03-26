library(chemometrics)


### Name: ridgeCV
### Title: Repeated CV for Ridge regression
### Aliases: ridgeCV
### Keywords: multivariate

### ** Examples

data(PAC)
res=ridgeCV(y~X,data=PAC,lambdaopt=4.3,repl=5,segments=5)



