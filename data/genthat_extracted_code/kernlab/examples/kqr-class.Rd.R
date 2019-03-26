library(kernlab)


### Name: kqr-class
### Title: Class "kqr"
### Aliases: kqr-class alpha,kqr-method cross,kqr-method error,kqr-method
###   kcall,kqr-method kernelf,kqr-method kpar,kqr-method param,kqr-method
###   alphaindex,kqr-method b,kqr-method xmatrix,kqr-method
###   ymatrix,kqr-method scaling,kqr-method
### Keywords: classes

### ** Examples



# create data
x <- sort(runif(300))
y <- sin(pi*x) + rnorm(300,0,sd=exp(sin(2*pi*x)))

# first calculate the median
qrm <- kqr(x, y, tau = 0.5, C=0.15)

# predict and plot
plot(x, y)
ytest <- predict(qrm, x)
lines(x, ytest, col="blue")

# calculate 0.9 quantile
qrm <- kqr(x, y, tau = 0.9, kernel = "rbfdot",
           kpar = list(sigma = 10), C = 0.15)
ytest <- predict(qrm, x)
lines(x, ytest, col="red")

# print model coefficients and other information
coef(qrm)
b(qrm)
error(qrm)
kernelf(qrm)



