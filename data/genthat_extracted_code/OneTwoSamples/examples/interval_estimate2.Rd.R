library(OneTwoSamples)


### Name: interval_estimate2
### Title: Two sided interval estimation of 'mu1-mu2' of two normal samples
### Aliases: interval_estimate2

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y

interval_estimate2(x, y, sigma = c(0.2, 0.3))
interval_estimate2(x, y, var.equal = TRUE)
interval_estimate2(x, y)



