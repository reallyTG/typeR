library(ssmrob)


### Name: ssmrob
### Title: Robust Sample Selection Model
### Aliases: ssmrob
### Keywords: Robust estimation Sample selection

### ** Examples

# sample selection model (Tobit-2)
data(MEPS2001)
attach(MEPS2001)
selectEq <- dambexp ~ age+female+educ+blhisp+totchr+ins
outcomeEq <- lnambx ~ age+female+educ+blhisp+totchr+ins
summary(ssmrob(outcomeEq,selectEq,control=heckitrob.control(tcc=3.2,weights.x1="robCov")))


# switching regressions example (Tobit-5)
library(mvtnorm)
covm <- diag(3)
covm[lower.tri(covm)] <- c(0.75, 0.5, 0.25)
covm[upper.tri(covm)] <- covm[lower.tri(covm)]
eps <- rmvnorm(1000, rep(0, 3), covm)
x1 <- rnorm(1000)
y1 <- x1 + eps[,1] > 0
x21 <- rnorm(1000)
x22 <- rnorm(1000)
y2=ifelse(y1 > 0.5, x21 + eps[,2], x22 + eps[,3])
summary(ssmrob(list(y2 ~ x21, y2 ~ x22), y1 ~ x1))



