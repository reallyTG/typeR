library(fitur)


### Name: build_dist
### Title: Build Distribution Functions
### Aliases: build_dist

### ** Examples

fittedDists <- build_dist(rpois(100,5), 'pois')
dpois(x = 5, lambda = 5)
fittedDists$dpois(5)
ppois(5, 5)
fittedDists$ppois(5)
qpois(.5, 5)
fittedDists$qpois(.5)
set.seed(8257)
rpois(100, 5)
set.seed(8257)
fittedDists$rpois(100)
fittedDists$parameters



