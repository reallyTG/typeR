library(apple)


### Name: predict.apple
### Title: Model prediction based on a fitted apple/cv.apple object.
### Aliases: predict.apple

### ** Examples

p=10
n=200
d=5
coefs=c(3,1.5,0,0,2)
intercept=0
beta=rep(0,p)
beta[1:d]=coefs
set.seed(2)
X=matrix(rnorm(p*n), nrow=n)
mu=1/(1+exp(-X %*% beta-intercept))
y=rbinom(n,1,mu)
	
fit.apple=apple(X, y, family="binomial")

set.seed(3)
testX=matrix(rnorm(p*n), nrow=n)

predict(fit.apple,testX,type="link")
predict(fit.apple,testX,type="response")
predict(fit.apple,testX,type="class")

fit=cv.apple(X, y, family="binomial", alpha=0)
predict(fit.apple,testX,type="link", which = fit$cv.loc)
predict(fit.apple,testX,type="response", which = fit$cv.loc)
predict(fit.apple,testX,type="class", which = fit$cv.loc)




