library(bfp)


### Name: Summary of BayesMfp object
### Title: Calculate and print the summary of a BayesMfp object
### Aliases: print.summary.BayesMfp summary.BayesMfp
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

## summary of multiple models:
summary(test)

## summary of just one model (no. 10):
summary(test[10])

## internal structure is usually not interesting:
str(summary(test[10]))



