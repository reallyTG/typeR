library(WebPower)


### Name: wp.crt2arm
### Title: Statistical Power Analysis for Cluster Randomized Trials with 2
###   Arms
### Aliases: wp.crt2arm

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.crt2arm(f = 0.6, n = 20, J = 10, icc = 0.1, alpha = 0.05, power = NULL)
#  Cluster randomized trials with 2 arms
#
#     J  n   f icc     power alpha
#    10 20 0.6 0.1 0.5901684  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt2arm

#To generate a power curve given a sequence of sample sizes:
res <- wp.crt2arm(f = 0.6, n = seq(20,100,10), J = 10,
                       icc = 0.1, alpha = 0.05, power = NULL)
res
#  Cluster randomized trials with 2 arms
#
#     J   n   f icc     power alpha
#    10  20 0.6 0.1 0.5901684  0.05
#    10  30 0.6 0.1 0.6365313  0.05
#    10  40 0.6 0.1 0.6620030  0.05
#    10  50 0.6 0.1 0.6780525  0.05
#    10  60 0.6 0.1 0.6890755  0.05
#    10  70 0.6 0.1 0.6971076  0.05
#    10  80 0.6 0.1 0.7032181  0.05
#    10  90 0.6 0.1 0.7080217  0.05
#    10 100 0.6 0.1 0.7118967  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt2arm

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.crt2arm(f = 0.8, n = NULL, J = 10,
                 icc = 0.1, alpha = 0.05, power = 0.8)
#  Cluster randomized trials with 2 arms
#
#     J        n   f icc power alpha
#    10 16.02558 0.8 0.1   0.8  0.05
#
#  NOTE: n is the number of subjects per cluster.
#  URL: http://psychstat.org/crt2arm
## End(No test)




