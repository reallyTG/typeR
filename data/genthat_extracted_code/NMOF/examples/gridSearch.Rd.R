library(NMOF)


### Name: gridSearch
### Title: Grid Search
### Aliases: gridSearch
### Keywords: optimize

### ** Examples

testFun <- function(x)
    x[1L] + x[2L]^2

sol <- gridSearch(fun = testFun, levels = list(1:2, c(2, 3, 5)))
sol$minfun
sol$minlevels

## specify all levels
levels <- list(a = 1:2, b = 1:3)
res <- gridSearch(testFun, levels)
res$minfun
sol$minlevels

## specify lower, upper and npar
lower <- 1; upper <- 3; npar <- 2
res <- gridSearch(testFun, lower = lower, upper = upper, npar = npar)
res$minfun
sol$minlevels

## specify lower, upper, npar and n
lower <- 1; upper <- 3; npar <- 2; n <- 4
res <- gridSearch(testFun, lower = lower, upper = upper, npar = npar, n = n)
res$minfun
sol$minlevels

## specify lower, upper and n
lower <- c(1,1); upper <- c(3,3); n <- 4
res <- gridSearch(testFun, lower = lower, upper = upper, n = n)
res$minfun
sol$minlevels

## specify lower, upper (auto-expanded) and n
lower <- c(1,1); upper <- 3; n <- 4
res <- gridSearch(testFun, lower = lower, upper = upper, n = n)
res$minfun
sol$minlevels



