library(AHR)


### Name: wkmQuantile
### Title: wkmQuantile
### Aliases: wkmQuantile

### ** Examples

T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
Y <- pmin(T, C)
D <- T <= C
Z <- rep(c(0,1), c(100, 100))
wkmQuantile(0.5, Surv(Y, D) ~ strata(Z), data.frame(Y=Y, D=D, Z=Z))



