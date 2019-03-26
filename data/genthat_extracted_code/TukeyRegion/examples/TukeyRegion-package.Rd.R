library(TukeyRegion)


### Name: TukeyRegion-package
### Title: Computation of the Tukey Region and the Tukey Median
### Aliases: TukeyRegion-package TukeyRegion-package
### Keywords: Tukey region Tukey depth Halfspace depth Location depth
###   Halfspace contour Tukey median Barycenter Depth-weighted trimmed mean

### ** Examples

# Load required packages
require(TukeyRegion)
require(MASS)
# Generate data
set.seed(1)
X <- mvrnorm(100, rep(0, 3), diag(3))
# Compute and visualize two Tukey regions
Tr1 <- TukeyRegion(X, 5, "bfs", 
  retFacets = TRUE, retVolume = TRUE, retBarycenter = TRUE)
Tr2 <- TukeyRegion(X, 25, "bfs", 
  retFacets = TRUE, retVolume = TRUE, retBarycenter = TRUE)
plot(Tr1, colorFacets = "red", colorRidges = "red", 
  colorPoints = "blue", alpha = 0.35)
plot(Tr2, newPlot = FALSE, drawPoints = FALSE, colorFacets = "green", 
  colorRidges = "green", alpha = 0.65)
(Tr1$barycenter)
(Tr2$barycenter)
# Compute arithmetic mean
T.mean <- colMeans(X)
(T.mean)
# Compute Tukey depth trimmed weighted mean (approximate depth)
T.approx1 <- depth.wm(X, 0.25)
(T.approx1)
T.approx2 <- depth.wm(X, 75)
(T.approx2)
# Compute Tukey depth trimmed weighted mean (exact depth)
T.exact1 <- depth.wm(X, 0.25, exact = TRUE)
(T.exact1)
T.exact2 <- depth.wm(X, 75, exact = TRUE)
(T.exact2)
# Compute and visualize Tukey median
Tm <- TukeyMedian(X)
(Tm$barycenter)
plot(Tm, newPlot = FALSE, drawPoints = FALSE)



