library(qrcmNP)


### Name: predict.piqr
### Title: Prediction After Penalized Quantile Regression Coefficients
###   Modeling
### Aliases: predict.piqr

### ** Examples


# using simulated data

set.seed(1234)
n <- 300
x1 <- rexp(n)
x2 <- runif(n, 0, 5)
x <- cbind(x1,x2)

b <- function(p){matrix(cbind(1, qnorm(p), slp(p, 2)), nrow=4, byrow=TRUE)}
theta <- matrix(0, nrow=3, ncol=4); theta[, 1] <- 1; theta[1,2] <- 1; theta[2:3,3] <- 2
qy <- function(p, theta, b, x){rowSums(x * t(theta %*% b(p)))}

y <- qy(runif(n), theta, b, cbind(1, x))

s <- matrix(1, nrow=3, ncol=4); s[1,3:4] <- 0
obj <- piqr(y ~ x1 + x2, formula.p = ~ I(qnorm(p)) + slp(p, 2), s=s, nlambda=50)

best <- gof.piqr(obj, method="AIC", plot=FALSE)

# predict beta(0.25), beta(0.5), beta(0.75)
predict(obj, best$minLambda, type = "beta", p = c(0.25,0.5, 0.75))

# predict the CDF and the PDF at new values of x and y
predict(obj, best$minLambda, type = "CDF",
        newdata = data.frame(x1=rexp(3), x2=runif(3), y = c(1,2,3)))

# computes the quantile function at new x, for p = (0.25,0.5,0.75)
predict(obj, best$minLambda, type = "QF", p = c(0.25,0.5,0.75),
        newdata = data.frame(x1=rexp(3), x2=runif(3), y = c(1,2,3)))

# simulate data from the fitted model
ysim <- predict(obj, best$minLambda, type = "sim") # 'newdata' can be supplied

# if the model is correct, the distribution of y and that of ysim should be similar
qy <- quantile(y, prob = seq(.1,.9,.1))
qsim <- quantile(ysim, prob = seq(.1,.9,.1))
plot(qy, qsim); abline(0,1)



