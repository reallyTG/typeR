library(grpss)


### Name: predict.cv.grpreg
### Title: Model predictions for a fitted 'cv.grpreg' object
### Aliases: predict.cv.grpreg

### ** Examples

library(MASS)
set.seed(23)
n <- 30 # sample size
p <- 3  # number of predictors in each group
J <- 50  # group size
group <- rep(1:J,each = 3)  # group indices
X <- mvrnorm(n,seq(0,5,length.out = p*J),diag(p*J))
beta <- runif(12,-2,5)
mu <- X%*%matrix(c(beta,rep(0,p*J-12)),ncol = 1)

# linear regression with family = "gaussian"
y <-  mu + rnorm(n)

## with cross-validation
gss11 <- grpss(X,y,group,select = TRUE,cross.validation = TRUE)
predict(gss11)  # fitted values
predict(gss11, newdata = X[1,])  # predicted values at given 'newdata'

# logistic regression with family = "binomial"
set.seed(23)
y1 <- rbinom(n,1,1/(1 + exp(-mu)))
gss21 <- grpss(X,y1,group, criterion = "gDC",select = TRUE,
               family = "binomial")
predict(gss21)



