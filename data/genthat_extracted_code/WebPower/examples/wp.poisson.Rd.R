library(WebPower)


### Name: wp.poisson
### Title: Statistical Power Analysis for Poisson Regression
### Aliases: wp.poisson

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.poisson(n = 4406, exp0 = 2.798, exp1 = 0.8938, alpha = 0.05,
                 power = NULL, family = "Bernoulli", parameter = 0.53)
#  Power for Poisson regression
#
#       n     power alpha  exp0   exp1    beta0      beta1 paremeter
#    4406 0.9999789  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson

#To generate a power curve given a sequence of sample sizes:
res <- wp.poisson(n = seq(800, 1500, 100), exp0 = 2.798, exp1 = 0.8938,
      alpha = 0.05, power = NULL, family = "Bernoulli", parameter = 0.53)
res
#  Power for Poisson regression
#
#       n     power alpha  exp0   exp1    beta0      beta1 paremeter
#     800 0.7324097  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#     900 0.7813088  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1000 0.8224254  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1100 0.8566618  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1200 0.8849241  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1300 0.9080755  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1400 0.9269092  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1500 0.9421344  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.poisson(n = NULL, exp0 = 2.798, exp1 = 0.8938, alpha = 0.05,
            power = 0.8, family = "Bernoulli", parameter = 0.53)
#  Power for Poisson regression
#
#           n power alpha  exp0   exp1    beta0      beta1 paremeter
#    943.2628   0.8  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson
## End(No test)




