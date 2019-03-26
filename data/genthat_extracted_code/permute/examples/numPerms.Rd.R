library(permute)


### Name: numPerms
### Title: Number of possible permutations for a given object
### Aliases: numPerms

### ** Examples

## permutation design --- see ?how
ctrl <- how() ## defaults to freely exchangeable

## vector input
v <- 1:10
(obs <- nobs(v))
numPerms(v, control = ctrl)

## integer input
len <- length(v)
(obs <- nobs(len))
numPerms(len, control = ctrl)

## new design, objects are a time series
ctrl <- how(within = Within(type = "series"))
numPerms(v, control = ctrl)
## number of permutations possible drastically reduced...
## ...turn on mirroring
ctrl <- how(within = Within(type = "series", mirror = TRUE))
numPerms(v, control = ctrl)

## Try blocking --- 2 groups of 5
bl <- numPerms(v, control = how(blocks = gl(2,5)))
bl

## should be same as
pl <- numPerms(v, control = how(plots = Plots(strata = gl(2,5))))
pl
stopifnot(all.equal(bl, pl))



