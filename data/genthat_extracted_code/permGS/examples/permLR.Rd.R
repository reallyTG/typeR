library(permGS)


### Name: permLR
### Title: Convenience function which calls createPermGS and nextStage to
###   perform fixed sample size permutation test without imputation
### Aliases: permLR

### ** Examples

## Two-sided permutation test
T <- rexp(100) ## event times
Z <- rbinom(100, 1, 0.5)  ## treatment assignment
C <- rexp(100) ## drop-out times
data <- data.frame(time=pmin(T,C), status=T<=C, Z=Z)
x <- permLR(Surv(time, status) ~ Z, data, alpha=c(0.025, 0.025))
summary(x)



