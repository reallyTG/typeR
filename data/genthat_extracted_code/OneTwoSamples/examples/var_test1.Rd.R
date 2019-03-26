library(OneTwoSamples)


### Name: var_test1
### Title: Two sided or one sided test of hypothesis of 'sigma^2' of one
###   normal sample
### Aliases: var_test1

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
var_test1(x, sigma2 = 0.2^2, mu = 1, side = 1)
var_test1(x, sigma2 = 0.2^2, side = 1)



