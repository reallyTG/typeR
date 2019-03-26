library(asbio)


### Name: lm.select
### Title: AIC, AICc, BIC, Mallow's Cp, and PRESS evaluation of linear
###   models
### Aliases: lm.select
### Keywords: univar

### ** Examples

Y <- rnorm(100)
X1 <- rnorm(100)
X2 <- rnorm(100)

lms <- list(lm(Y ~ X1), lm(Y ~ X1 + X2))
lm.select(lms)




