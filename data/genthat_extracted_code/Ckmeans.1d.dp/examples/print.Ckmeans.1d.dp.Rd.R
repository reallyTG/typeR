library(Ckmeans.1d.dp)


### Name: print.Ckmeans.1d.dp
### Title: Print Optimal Univariate Clustering Results
### Aliases: print.Ckmeans.1d.dp print.Ckmedian.1d.dp
### Keywords: univar cluster print

### ** Examples

# Example: clustering data generated from a Gaussian
#          mixture model of two components
x <- c(rnorm(15, mean=-1, sd=0.3),
       rnorm(15, mean=1, sd=0.3))
res <- Ckmeans.1d.dp(x)
print(res)

res <- Ckmedian.1d.dp(x)
print(res)

y <- (rnorm(length(x)))^2
res <- Ckmeans.1d.dp(x, y=y)
print(res)

res <- Ckmedian.1d.dp(x)
print(res)



