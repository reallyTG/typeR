library(FDboost)


### Name: integrationWeights
### Title: Functions to compute integration weights
### Aliases: integrationWeights integrationWeightsLeft
###   integrationWeightsLeft

### ** Examples

## Example for trapezoidal integration weights
xind0 <- seq(0,1,l = 5)
xind <- c(0, 0.1, 0.3, 0.7, 1)
X1 <- matrix(xind^2, ncol = length(xind0), nrow = 2)

# Regualar observation points
integrationWeights(X1, xind0)
# Irregular observation points
integrationWeights(X1, xind)

# with missing value
X1[1,2] <- NA
integrationWeights(X1, xind0)
integrationWeights(X1, xind)

## Example for left integration weights
xind0 <- seq(0,1,l = 5)
xind <- c(0, 0.1, 0.3, 0.7, 1)
X1 <- matrix(xind^2, ncol = length(xind0), nrow = 2)

# Regular observation points
integrationWeightsLeft(X1, xind0, leftWeight = "mean") 
integrationWeightsLeft(X1, xind0, leftWeight = "first") 
integrationWeightsLeft(X1, xind0, leftWeight = "zero")

# Irregular observation points
integrationWeightsLeft(X1, xind, leftWeight = "mean") 
integrationWeightsLeft(X1, xind, leftWeight = "first") 
integrationWeightsLeft(X1, xind, leftWeight = "zero")

# obervation points that do not start with 0
xind2 <- xind + 0.5
integrationWeightsLeft(X1, xind2, leftWeight = "zero")
 



