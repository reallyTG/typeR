library(WebPower)


### Name: wp.logistic
### Title: Statistical Power Analysis for Logistic Regression
### Aliases: wp.logistic

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.logistic(n = 200, p0 = 0.15, p1 = 0.1, alpha = 0.05,
            power = NULL, family = "normal", parameter = c(0,1))
#  Power for logistic regression
#
#      p0  p1     beta0      beta1   n alpha     power
#    0.15 0.1 -1.734601 -0.4626235 200  0.05 0.6299315
#
#  URL: http://psychstat.org/logistic

#To generate a power curve given a sequence of sample sizes:
res <- wp.logistic(n = seq(100,500,50), p0 = 0.15, p1 = 0.1, alpha = 0.05,
                power = NULL, family = "normal", parameter = c(0,1))
res
#  Power for logistic regression
#
#      p0  p1     beta0      beta1   n alpha     power
#    0.15 0.1 -1.734601 -0.4626235 100  0.05 0.3672683
#    0.15 0.1 -1.734601 -0.4626235 150  0.05 0.5098635
#    0.15 0.1 -1.734601 -0.4626235 200  0.05 0.6299315
#    0.15 0.1 -1.734601 -0.4626235 250  0.05 0.7264597
#    0.15 0.1 -1.734601 -0.4626235 300  0.05 0.8014116
#    0.15 0.1 -1.734601 -0.4626235 350  0.05 0.8580388
#    0.15 0.1 -1.734601 -0.4626235 400  0.05 0.8998785
#    0.15 0.1 -1.734601 -0.4626235 450  0.05 0.9302222
#    0.15 0.1 -1.734601 -0.4626235 500  0.05 0.9518824
#
#  URL: http://psychstat.org/logistic

#To plot the power curve:
plot(res)

#To calculate the required sample size given power and effect size:
wp.logistic(n = NULL, p0 = 0.15, p1 = 0.1, alpha = 0.05,
              power = 0.8, family = "normal", parameter = c(0,1))
#  Power for logistic regression
#
#      p0  p1     beta0      beta1        n alpha power
#    0.15 0.1 -1.734601 -0.4626235 298.9207  0.05   0.8
#
#  URL: http://psychstat.org/logistic
## End(No test)




