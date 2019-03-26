library(ToolsForCoDa)


### Name: canocov
### Title: Canonical correlation analysis.
### Aliases: canocov
### Keywords: multivariate

### ** Examples

set.seed(123)
X <- matrix(runif(75),ncol=3)
Y <- matrix(runif(75),ncol=3)
cca.results <- canocov(X,Y)



