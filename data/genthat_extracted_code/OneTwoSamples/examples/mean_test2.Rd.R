library(OneTwoSamples)


### Name: mean_test2
### Title: Two sided or one sided test of hypothesis of 'mu1' and 'mu2' of
###   two normal samples
### Aliases: mean_test2

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
mean_test2(x, y, sigma = c(0.2, 0.3), side = 1)
mean_test2(x, y, var.equal = TRUE, side = 1)
mean_test2(x, y, side = 1)



