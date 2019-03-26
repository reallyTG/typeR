library(TukeyRegion)


### Name: TukeyRegion
### Title: Computation of the Tukey Region
### Aliases: TukeyRegion

### ** Examples

# Load required packages
require(TukeyRegion)
require(MASS)
# Generate data
set.seed(1)
X <- mvrnorm(500, rep(0, 3), 
  matrix(c(1, 1, 1, 1, 2, 2, 1, 2, 4), nrow = 3))
# Compute the Tukey region
Tr <- TukeyRegion(X, 10, "bfs", 
  retFacets = TRUE, retVolume = TRUE, retBarycenter = TRUE)
summary(Tr)
# Visualize the Tukey region
plot(Tr)



