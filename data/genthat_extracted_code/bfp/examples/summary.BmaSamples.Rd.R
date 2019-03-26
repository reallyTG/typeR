library(bfp)


### Name: Summary of BmaSamples object
### Title: Calculate and print the summary of a BmaSamples object
### Aliases: print.summary.BmaSamples summary.BmaSamples
### Keywords: methods

### ** Examples

## generate a BmaSamples object
set.seed(19)

x1 <- rnorm(n=15)
x2 <- rbinom(n=15, size=20, prob=0.5) 
x3 <- rexp(n=15)

y <- rt(n=15, df=2)

test <- BayesMfp(y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 100,
                 method="exhaustive")

testBma <- BmaSamples(test)

## look at the summary
summary(testBma)

## and its structure
str(summary(testBma))



