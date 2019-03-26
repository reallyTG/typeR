library(scalreg)


### Name: scalreg
### Title: Scaled sparse linear regression
### Aliases: scalreg
### Keywords: scalreg

### ** Examples

data(sp500)
attach(sp500)
x = sp500.percent[,3: (dim(sp500.percent)[2])]
y = sp500.percent[,1]

object = scalreg(x,y)
##print(object)

object = scalreg(x,y,LSE=TRUE)
print(object$hsigma)
print(object$lse$hsigma)

detach(sp500)



