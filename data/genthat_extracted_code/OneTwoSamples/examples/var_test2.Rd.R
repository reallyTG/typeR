library(OneTwoSamples)


### Name: var_test2
### Title: Two sided or one sided test of hypothesis of 'sigma1^2' and
###   'sigma2^2' of two normal samples
### Aliases: var_test2

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
var_test2(x, y, mu = c(1, 2), side = 1)
var_test2(x, y, side = 1)



