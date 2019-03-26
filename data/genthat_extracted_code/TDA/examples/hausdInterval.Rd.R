library(TDA)


### Name: hausdInterval
### Title: Subsampling Confidence Interval for the Hausdorff Distance
###   between a Manifold and a Sample
### Aliases: hausdInterval
### Keywords: nonparametric htest

### ** Examples

X <- circleUnif(1000)
interval <- hausdInterval(X, m = 800)
print(interval)



