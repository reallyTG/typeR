library(TukeyRegion)


### Name: depth.wm
### Title: Computation of the Tukey depth weighted and/or trimmed mean
### Aliases: depth.wm

### ** Examples

# Load required packages
require(TukeyRegion)
require(bfp)
# Generate data
set.seed(1)
X <- bfp:::rmvt(150, diag(3), rep(0, 3), 1)
# Compute arithmetic mean
T.mean <- colMeans(X)
(T.mean)
# Compute Tukey depth trimmed weighted mean (approximate depth)
T.approx1 <- depth.wm(X, 0.25)
(T.approx1)
T.approx2 <- depth.wm(X, 25)
(T.approx2)
# Compute Tukey depth trimmed weighted mean (exact depth)
T.exact1 <- depth.wm(X, 0.25, exact = TRUE)
(T.exact1)
T.exact2 <- depth.wm(X, 25, exact = TRUE)
(T.exact2)
# Compute Tukey median
Tm <- TukeyMedian(X)
(Tm$barycenter)



