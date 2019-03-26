library(WRS2)


### Name: binband
### Title: Comparison of discrete distributions
### Aliases: binband discANOVA discmcp discstep
### Keywords: models

### ** Examples

## Consider a study aimed at comparing two methods for reducing shoulder pain after surgery. 
## For the first method, the shoulder pain measures are:
x1 <- c(2, 4, 4, 2, 2, 2, 4, 3, 2, 4, 2, 3, 2, 4, 3, 2, 2, 3, 5, 5, 2, 2)
## and for the second method they are:
x2 <- c(5, 1, 4, 4, 2, 3, 3, 1, 1, 1, 1, 2, 2, 1, 1, 5, 3, 5)

fit1 <- binband(x1, x2)
fit1

fit2 <- binband(x1, x2, KMS = TRUE, alpha = 0.01)
fit2

## More than two groups: 
discANOVA(libido ~ dose, viagra, nboot = 200)

## Multiple comparisons:
discmcp(libido ~ dose, viagra)

discstep(libido ~ dose, viagra)




