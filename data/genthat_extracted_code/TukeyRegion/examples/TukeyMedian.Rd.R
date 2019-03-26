library(TukeyRegion)


### Name: TukeyMedian
### Title: Computation of the Tukey median set and Tukey median
### Aliases: TukeyMedian

### ** Examples

# Load required packages
require(TukeyRegion)
require(MASS)
# Generate data
set.seed(1)
X <- mvrnorm(100, rep(0, 3), 
  matrix(c(1, 1, 1, 1, 2, 2, 1, 2, 4), nrow = 3))
# Compute the Tukey median
Tm <- TukeyMedian(X)
summary(Tm)
# Visualize the Tukey median
plot(Tm)



