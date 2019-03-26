library(WebPower)


### Name: wp.crt3arm
### Title: Statistical Power Analysis for Cluster Randomized Trials with 3
###   Arms
### Aliases: wp.crt3arm

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.crt3arm(f = 0.5, n = 20, J = 10, icc = 0.1, alpha = 0.05, power = NULL)
#  Cluster randomized trials with 3 arms
#
#     J  n   f icc     power alpha
#    10 20 0.5 0.1 0.3940027  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt3arm

#To generate a power curve given a sequence of sample sizes:
res <- wp.crt3arm(f = 0.5, n = seq(20, 100, 10), J = 10,
                       icc = 0.1, alpha = 0.05, power = NULL)
res
#  Cluster randomized trials with 3 arms
#
#     J   n   f icc     power alpha
#    10  20 0.5 0.1 0.3940027  0.05
#    10  30 0.5 0.1 0.4304055  0.05
#    10  40 0.5 0.1 0.4513376  0.05
#    10  50 0.5 0.1 0.4649131  0.05
#    10  60 0.5 0.1 0.4744248  0.05
#    10  70 0.5 0.1 0.4814577  0.05
#    10  80 0.5 0.1 0.4868682  0.05
#    10  90 0.5 0.1 0.4911592  0.05
#    10 100 0.5 0.1 0.4946454  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt3arm

#To plot the power curve:
plot(res)

#To calculate the required sample size given power and effect size:
wp.crt3arm(f = 0.8, n = NULL, J = 10, icc = 0.1, alpha = 0.05, power = 0.8)
#  Cluster randomized trials with 3 arms
#
#     J        n   f icc power alpha
#    10 27.25145 0.8 0.1   0.8  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt3arm
## End(No test)




