library(locfit)


### Name: lscv.exact
### Title: Exact LSCV Calculation
### Aliases: lscv.exact
### Keywords: htest

### ** Examples

data(geyser, package="locfit")
lscv.exact(lp(geyser,h=0.25))
# equivalent form using lscv
lscv(lp(geyser, h=0.25), exact=TRUE)



