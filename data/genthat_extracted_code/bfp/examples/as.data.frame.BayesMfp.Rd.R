library(bfp)


### Name: as.data.frame.BayesMfp
### Title: Convert a BayesMfp object to a data frame
### Aliases: as.data.frame.BayesMfp
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

## get the models data frame
as.data.frame(test)



