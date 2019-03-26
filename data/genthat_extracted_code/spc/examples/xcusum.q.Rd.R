library(spc)


### Name: xcusum.q
### Title: Compute RL quantiles of CUSUM control charts
### Aliases: xcusum.q
### Keywords: ts

### ** Examples

## Waldmann (1986), one-sided CUSUM, Table 2
## original values are 345, 82, 9

XCUSUM.Q <- Vectorize("xcusum.q", "alpha")
k <- .5
h <- 3
mu <- 0 # corresponds to Waldmann's -0.5
a.list <- c(.95, .5, .05)
rl.quantiles <- ceiling(XCUSUM.Q(k, h, mu, a.list))
cbind(a.list, rl.quantiles)



