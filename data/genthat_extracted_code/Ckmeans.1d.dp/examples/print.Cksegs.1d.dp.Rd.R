library(Ckmeans.1d.dp)


### Name: print.Cksegs.1d.dp
### Title: Print Optimal Univariate Segmentation Results
### Aliases: print.Cksegs.1d.dp
### Keywords: univar cluster print

### ** Examples

# Example: clustering data generated from a Gaussian
#          mixture model of two components
x <- c(rnorm(15, mean=-1, sd=0.3),
       rnorm(15, mean=1, sd=0.3))

y <- x^3
res <- Cksegs.1d.dp(y, x=x)
print(res, lwd=2)



