library(eivtools)


### Name: eivreg
### Title: Errors-in-variables (EIV) linear regression
### Aliases: eivreg
### Keywords: models regression

### ** Examples

set.seed(1001)
## simulate data with covariates x1, x2 and z.
.n    <- 1000
.d    <- data.frame(x1 = rnorm(.n))
.d$x2 <- sqrt(0.5)*.d$x1 + rnorm(.n, sd=sqrt(0.5))
.d$z  <- as.numeric(.d$x1 + .d$x2 > 0)

## generate outcome
## true regression parameters are c(2,1,1,-1)
.d$y  <- 2.0 + 1.0*.d$x1 + 1.0*.d$x2 - 1.0*.d$z + rnorm(.n)

## generate error-prone covariates w1 and w2
Sigma_error <- diag(c(0.20, 0.30))
dimnames(Sigma_error) <- list(c("w1","w2"), c("w1","w2"))
.d$w1 <- .d$x1 + rnorm(.n, sd = sqrt(Sigma_error["w1","w1"]))
.d$w2 <- .d$x2 + rnorm(.n, sd = sqrt(Sigma_error["w2","w2"]))

## fit EIV regression specifying known measurement error covariance matrix
.mod1 <- eivreg(y ~ w1 + w2 + z, data = .d, Sigma_error = Sigma_error)
print(class(.mod1))
.tmp <- summary(.mod1)
print(class(.tmp))
print(.tmp)

## fit EIV regression specifying known reliabilities.  Note that
## point estimator is slightly different from .mod1 because
## the correction matrix S must be estimated when the reliability
## is known.
.lambda <- c(1,1) / (c(1,1) + diag(Sigma_error))
.mod2 <- eivreg(y ~ w1 + w2 + z, data = .d, reliability = .lambda)
print(summary(.mod2))



