library(TSA)


### Name: tsdiag.TAR
### Title: Model diagnostics for a fitted TAR model
### Aliases: tsdiag.TAR
### Keywords: methods

### ** Examples

data(prey.eq)
prey.tar.1=tar(y=log(prey.eq),p1=4,p2=4,d=3,a=.1,b=.9,print=TRUE)
tsdiag(prey.tar.1)



