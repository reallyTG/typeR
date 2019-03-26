library(rgr)


### Name: gx.scores
### Title: Function to Compute Scores on the Basis of Threshold Estimates
### Aliases: gx.scores
### Keywords: multivariate

### ** Examples

##  Make test data available
data(sind)
attach(sind)

##  Compute scores - 1
sind.scores1 <- gx.scores(cbind(Cu, Zn, Cd), tholds = c(100, 200, 2))
map.z(E, N, sind.scores1$scores)

##  Compute scores - 2
sind.scores2 <- gx.scores(cbind(Cu, Zn, Cd, Fe), tholds = c(100, 200, 2, 2),
	rwts = c(1, 1, 1, -1))
xyplot.z(Fe, Mn, sind.scores2$scores, col = 2)

## Clean up and detach test data
rm(sind.scores1)
rm(sind.scores2)
detach(sind)



