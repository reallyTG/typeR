library(hdm)


### Name: rlasso
### Title: rlasso: Function for Lasso estimation under homoscedastic and
###   heteroscedastic non-Gaussian disturbances
### Aliases: rlasso rlasso.character rlasso.default rlasso.formula

### ** Examples

set.seed(1)
n = 100 #sample size
p = 100 # number of variables
s = 3 # nubmer of variables with non-zero coefficients
X = Xnames = matrix(rnorm(n*p), ncol=p)
colnames(Xnames) <- paste("V", 1:p, sep="")
beta = c(rep(5,s), rep(0,p-s))
Y = X%*%beta + rnorm(n)
reg.lasso <- rlasso(Y~Xnames)
Xnew = matrix(rnorm(n*p), ncol=p)  # new X
colnames(Xnew) <- paste("V", 1:p, sep="")
Ynew =  Xnew%*%beta + rnorm(n)  #new Y
yhat = predict(reg.lasso, newdata = Xnew)



