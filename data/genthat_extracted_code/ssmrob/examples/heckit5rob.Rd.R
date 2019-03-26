library(ssmrob)


### Name: heckit5rob
### Title: Robust Heckit Fit: Switching Regressions
### Aliases: heckit5rob
### Keywords: Sample selection Robust estimator

### ** Examples

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
summary(heckit5rob(y2 ~ x21, y2 ~ x22, y1 ~ x1))


