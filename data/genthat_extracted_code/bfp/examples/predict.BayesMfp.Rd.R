library(bfp)


### Name: predict.BayesMfp
### Title: Predict method for BayesMfp objects
### Aliases: predict.BayesMfp
### Keywords: methods

### ** Examples

## generate a BayesMfp object
set.seed(19)

x1 <- rnorm(n=15)
x2 <- rbinom(n=15, size=20, prob=0.5) 
x3 <- rexp(n=15)

y <- rt(n=15, df=2)

test <- BayesMfp(y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 100,
                 method="exhaustive")

## predict new responses at (again random) covariates
predict(test,
        newdata = list(x1 = rnorm (15),
                       x2 = rbinom (n=15, size=5, prob=0.2) + 1,
                       x3 = rexp (15)))



