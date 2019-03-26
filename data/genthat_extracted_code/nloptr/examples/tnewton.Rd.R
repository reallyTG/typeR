library(nloptr)


### Name: tnewton
### Title: Preconditioned Truncated Newton
### Aliases: tnewton

### ** Examples


flb <- function(x) {
    p <- length(x)
    sum(c(1, rep(4, p-1)) * (x - c(1, x[-p])^2)^2)
}
# 25-dimensional box constrained: par[24] is *not* at boundary
S <- tnewton(rep(3, 25), flb, lower=rep(2, 25), upper=rep(4, 25),
                nl.info = TRUE, control = list(xtol_rel=1e-8))
## Optimal value of objective function:  368.105912874334
## Optimal value of controls: 2  ...  2  2.109093  4




