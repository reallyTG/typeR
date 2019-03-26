library(bfp)


### Name: inclusionProbs
### Title: Compute (model averaged) posterior variable inclusion
###   probabilites
### Aliases: inclusionProbs
### Keywords: htest

### ** Examples

## construct a BayesMfp object
set.seed(19)

x1 <- rnorm (n=15)
x2 <- rbinom (n=15, size=20, prob=0.5) 
x3 <- rexp (n=15)

y <- rt (n=15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 200, method="exhaustive")

## now get the local inclusion probabilities
local <- inclusionProbs(test)

## they can be compared with the global inclusion probabilities
local - attr(test, "inclusionProbs")



