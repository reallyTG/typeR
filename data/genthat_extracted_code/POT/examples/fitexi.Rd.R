library(POT)


### Name: fitexi
### Title: Extremal Index Estimation
### Aliases: fitexi
### Keywords: htest

### ** Examples

n.obs <- 500
x <- rexp(n.obs + 1)
y <- pmax(x[-1], x[-(n.obs + 1)])## The extremal index is 0.5

u <- quantile(y, 0.95)
fitexi(y, u)



