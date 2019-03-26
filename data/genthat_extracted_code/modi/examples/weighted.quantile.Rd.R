library(modi)


### Name: weighted.quantile
### Title: Quantiles of a weighted cdf
### Aliases: weighted.quantile

### ** Examples

x <- rnorm(100)
x[sample(1:100, 20)] <- NA
w <- rchisq(100, 2)
weighted.quantile(x, w, 0.2, TRUE)



