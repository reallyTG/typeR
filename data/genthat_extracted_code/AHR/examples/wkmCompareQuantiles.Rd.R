library(AHR)


### Name: wkmCompareQuantiles
### Title: wkmCompareQuantiles
### Aliases: wkmCompareQuantiles

### ** Examples

T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
Y <- pmin(T, C)
D <- T <= C
Z <- rep(c(0,1), c(100, 100)) # treatment indicator
wkmCompareQuantiles(0.5, Surv(Y, D) ~ Z, data.frame(Y=Y, D=D, Z=Z))



