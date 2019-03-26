library(AHR)


### Name: rmeanDiff.ahr
### Title: rmeanDiff.ahr
### Aliases: rmeanDiff.ahr

### ** Examples

T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
Y <- pmin(T, C)
D <- T <= C
Z <- rep(c(0,1), c(100, 100))
fit <- avgHR(2, data.frame(Y=Y, D=D, Z=Z), formula=Surv(Y, D) ~ Z)
rmd <- rmeanDiff.ahr(fit)



