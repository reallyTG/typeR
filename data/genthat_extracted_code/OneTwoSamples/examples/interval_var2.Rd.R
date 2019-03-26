library(OneTwoSamples)


### Name: interval_var2
### Title: Two sided interval estimation of 'sigma1^2 / sigma2^2' of two
###   normal samples
### Aliases: interval_var2

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
interval_var2(x, y, mu = c(1,2))
interval_var2(x, y)



