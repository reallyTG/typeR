library(kernlab)


### Name: kqr
### Title: Kernel Quantile Regression.
### Aliases: kqr kqr,formula-method kqr,vector-method kqr,matrix-method
###   kqr,list-method kqr,kernelMatrix-method coef,kqr-method
###   show,kqr-method
### Keywords: regression nonlinear methods

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
           kpar= list(sigma=10), C=0.15)
ytest <- predict(qrm, x)
lines(x, ytest, col="red")

# calculate 0.1 quantile
qrm <- kqr(x, y, tau = 0.1,C=0.15)
ytest <- predict(qrm, x)
lines(x, ytest, col="green")

# print first 10 model coefficients
coef(qrm)[1:10]



