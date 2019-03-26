library(Ckmeans.1d.dp)


### Name: plot.Ckmeans.1d.dp
### Title: Plot Optimal Univariate Clustering Results
### Aliases: plot.Ckmeans.1d.dp plot.Ckmedian.1d.dp
### Keywords: univar cluster hplot distribution

### ** Examples

# Example: clustering data generated from a Gaussian
#          mixture model of three components
x <- c(rnorm(50, mean=-1, sd=0.3),
       rnorm(50, mean=1, sd=0.3),
       rnorm(50, mean=3, sd=0.3))

res <- Ckmeans.1d.dp(x)
plot(res)

y <- (rnorm(length(x)))^2
res <- Ckmeans.1d.dp(x, y=y)
plot(res)

res <- Ckmedian.1d.dp(x)
plot(res)



