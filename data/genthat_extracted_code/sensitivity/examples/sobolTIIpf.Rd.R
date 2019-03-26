library(sensitivity)


### Name: sobolTIIpf
### Title: Pick-freeze Estimation of Total Interaction Indices
### Aliases: sobolTIIpf tell.sobolTIIpf print.sobolTIIpf plot.sobolTIIpf
###   plotFG.sobolTIIpf plotFG
### Keywords: design

### ** Examples

# Test case : the Ishigami function

# The method requires 2 samples
n <- 1000
X1 <- data.frame(matrix(runif(3 * n, -pi, pi), nrow = n))
X2 <- data.frame(matrix(runif(3 * n, -pi, pi), nrow = n))

# sensitivity analysis (the true values are 0, 0.244, 0)
x <- sobolTIIpf(model = ishigami.fun, X1 = X1, X2 = X2)
print(x)

# plot of tiis and FANOVA graph
plot(x)

## No test: 
library(igraph)
plotFG(x)
## End(No test)



