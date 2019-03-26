library(MGLM)


### Name: predict
### Title: Predict method for MGLM Fits
### Aliases: predict predict,MGLMreg,ANY-method predict,MGLMreg-method
###   predict,MGLMreg

### ** Examples

n <- 200
p <- 5
d <- 4
X <- matrix(runif(p * n), n, p)
alpha <- matrix(c(0.6, 0.8, 1), p, d - 1, byrow=TRUE)
alpha[c(1, 2),] <- 0
Alpha <- exp(X %*% alpha) 
beta <- matrix(c(1.2, 1, 0.6), p, d - 1, byrow=TRUE)
beta[c(1, 2),] <- 0
Beta <- exp(X %*% beta)
m <- runif(n, min=0, max=25) + 25
Y <- rgdirmn(n, m, Alpha, Beta)
gdmReg <- MGLMreg(Y~0+X, dist="GDM")
newX <- matrix(runif(1*p), 1, p)
pred <- predict(gdmReg, newX)




