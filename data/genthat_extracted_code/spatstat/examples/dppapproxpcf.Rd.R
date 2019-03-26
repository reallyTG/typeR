library(spatstat)


### Name: dppapproxpcf
### Title: Approximate Pair Correlation Function of Determinantal Point
###   Process Model
### Aliases: dppapproxpcf

### ** Examples

f <- dppapproxpcf(dppMatern(lambda = 100, alpha=.028, nu=1, d=2))
plot(f, xlim = c(0,0.1))



