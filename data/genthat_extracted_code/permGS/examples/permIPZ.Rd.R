library(permGS)


### Name: permIPZ
### Title: Convenience function which calls createPermGS and nextStage to
###   perform fixed sample size permutation test with IPZ method
### Aliases: permIPZ

### ** Examples

T <- rexp(30) ## event times
Z <- rbinom(30, 1, 0.5)  ## treatment assignment
C <- rexp(30) ## drop-out times
data <- data.frame(time=pmin(T,C), status=T<=C, Z=Z)
x <- permIPZ(Surv(time, status) ~ Z, data)
summary(x)



