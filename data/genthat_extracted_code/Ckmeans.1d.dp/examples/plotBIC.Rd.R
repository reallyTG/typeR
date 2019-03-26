library(Ckmeans.1d.dp)


### Name: plotBIC
### Title: Plot Bayesian Information Criterion as a Function of Number of
###   Clusters
### Aliases: plotBIC
### Keywords: univar cluster hplot

### ** Examples

# Example: clustering data generated from a Gaussian mixture
#          model of two components
x <- rnorm(50, mean=-1, sd=0.3)
x <- append(x, rnorm(50, mean=1, sd=0.3) )
res <- Ckmeans.1d.dp(x)
plotBIC(res)

y <- (rnorm(length(x)))^2
res <- Ckmeans.1d.dp(x, y=y)
plotBIC(res)



