library(RcppTN)


### Name: rtn
### Title: Truncated Normal Distribution RNG
### Aliases: rtn

### ** Examples

set.seed(1)
rtn(0, 1, -Inf, Inf) # single draw from a single distribution

## [1] -0.6264538

set.seed(1)
rtn(0, 1, -Inf, Inf) # again, because it respects the RNG state

## [1] -0.6264538

rtn(rep(0, 3),
    rep(1, 3),
    rep(-Inf, 3),
    rep(Inf, 3)
    ) # multiple draws from a single distribution

## [1]  0.1836433 -0.8356286  1.5952808

rtn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) # multiple draws, each from a different distribution
## [1] 0.3295078 5.3917301



