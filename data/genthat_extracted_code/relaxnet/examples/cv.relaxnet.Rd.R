library(relaxnet)


### Name: cv.relaxnet
### Title: Cross-Validation for relaxnet Models
### Aliases: cv.relaxnet cv.alpha.relaxnet

### ** Examples

## generate predictor matrix

nobs <- 100
nvars <- 200

set.seed(23)

x <- matrix(rnorm(nobs * nvars), nobs, nvars)

## make sure it has unique colnames

colnames(x) <- paste("x", 1:ncol(x), sep = "")

## let y depend on first 5 columns plus noise

y <- rowSums(x[, 1:5]) + rnorm(nrow(x))

## run cv.relaxnet

cv.result <- cv.relaxnet(x, y)

predict(cv.result, type = "nonzero")

## very few false positives compared to glmnet alone

## glmnet min rule

predict(cv.result$relaxnet.fit$main.glmnet.fit,
        type = "nonzero",
        s = cv.result$main.lambda.min)

## glmnet 1se rule

predict(cv.result$relaxnet.fit$main.glmnet.fit,
        type = "nonzero",
        s = cv.result$main.lambda.1se)

## get values of the coefs for cv.relaxnet's chosen fit

coefs <- drop(predict(cv.result, type = "coef"))

coefs[coefs != 0]



