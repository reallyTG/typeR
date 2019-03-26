library(Ckmeans.1d.dp)


### Name: plot.Cksegs.1d.dp
### Title: Plot Optimal Univariate Segmentation Results
### Aliases: plot.Cksegs.1d.dp
### Keywords: univar cluster hplot distribution

### ** Examples

# Example: clustering data generated from a Gaussian
#          mixture model of three components
x <- c(rnorm(50, mean=-1, sd=0.3),
       rnorm(50, mean=1, sd=0.3),
       rnorm(50, mean=3, sd=0.3))

y <- x^3
res <- Cksegs.1d.dp(y, x=x)
plot(res, lwd=2)




