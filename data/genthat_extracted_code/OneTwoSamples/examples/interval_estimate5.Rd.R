library(OneTwoSamples)


### Name: interval_estimate5
### Title: Two sided or one sided interval estimation of 'mu1-mu2' of two
###   normal samples
### Aliases: interval_estimate5

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y

interval_estimate5(x, y, sigma = c(0.2, 0.3), side = -1)
interval_estimate5(x, y, var.equal = TRUE)
interval_estimate5(x, y)



