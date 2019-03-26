library(OneTwoSamples)


### Name: interval_var4
### Title: Two sided or one sided interval estimation of 'sigma1^2 /
###   sigma2^2' of two normal samples
### Aliases: interval_var4

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
interval_var4(x, y, mu = c(1,2), side = -1)
interval_var4(x, y)



