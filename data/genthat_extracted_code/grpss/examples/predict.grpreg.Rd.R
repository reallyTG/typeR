library(grpss)


### Name: predict.grpreg
### Title: Model predictions for a fitted 'grpreg' object
### Aliases: predict.grpreg

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

## without cross-validation
gss12 <- grpss(X,y,ncut = 10,group,select = TRUE)
predict(gss12) # fitted values
predict(gss12,lambda = 0.2) # fitted values at lambda = 0.2

# logistic regression with family = "binomial"
set.seed(23)
y1 <- rbinom(n,1,1/(1 + exp(-mu)))
gss21 <- grpss(X,y1,group, criterion = "gDC",select = TRUE,
               family = "binomial")
predict(gss21)



