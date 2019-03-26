library(pracma)


### Name: geo_median
### Title: Geometric Median
### Aliases: geo_median
### Keywords: optimize

### ** Examples

# Generate 100 points on the unit sphere in the 10-dim. space
set.seed(1001)
P <- rands(n=100, N=9)
( sol <- geo_median(P) )
# $p
#  [1] -0.009481361 -0.007643410 -0.001252910  0.006437703 -0.019982885 -0.045337987
#  [7]  0.036249563  0.003232175  0.035040592  0.046713023
# $d
# [1] 99.6638
# $reltol
# [1] 3.069063e-08
# $niter
# [1] 10



