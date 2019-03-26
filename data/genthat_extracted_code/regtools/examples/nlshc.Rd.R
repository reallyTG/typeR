library(regtools)


### Name: nlshc
### Title: Heteroscedastic Nonlinear Regression
### Aliases: nlshc

### ** Examples

# simulate data from a setting in which mean Y is 
# 1 / (b1 * X1 + b2 * X2)
n <- 250
b <- 1:2
x <- matrix(rexp(2*n),ncol=2)
meany <- 1 / (x %*% b)  # reg ftn
y <- meany + (runif(n) - 0.5) * meany  # heterosced epsilon
xy <- cbind(x,y)
xy <- data.frame(xy)
# see nls() docs
nlout <- nls(X3 ~ 1 / (b1*X1+b2*X2),
   data=xy,start=list(b1 = 1,b2=1))
nlshc(nlout)



