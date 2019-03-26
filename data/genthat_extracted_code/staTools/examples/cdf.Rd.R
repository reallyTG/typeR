library(staTools)


### Name: cdf
### Title: Cumulative Distribution Function
### Aliases: cdf
### Keywords: cumulative distribution empirical function

### ** Examples

x = rdispl(n = 1e4, xmin = 10, alpha = 2.5, xmax = 1e5)
obs = cdf(x)$x
ecdf = cdf(x)$y



