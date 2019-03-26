library(bfp)


### Name: findModel
### Title: Find a specific fractional polynomial model in a BayesMfp object
### Aliases: findModel
### Keywords: utilities

### ** Examples

## construct a BayesMfp object
set.seed(92)

x1 <- rnorm (15)
x2 <- rbinom (n=15, size=20, prob=0.6)
x3 <- rexp (15)
y <- rt (15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels=2000, method="exhaustive")

## copy one model 
myModel <- test[[1]]

## and modify it!
myModel$powers[["x2"]] <- c (1, 2)
stopifnot(identical(findModel (myModel, test),
                    31L))



