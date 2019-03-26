library(WebPower)


### Name: wp.mrt2arm
### Title: Statistical Power Analysis for Multisite Randomized Trials with
###   2 Arms
### Aliases: wp.mrt2arm

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
#For main effect
wp.mrt2arm(n = 45, f = 0.5, J = 20, tau11 = 0.5,
            sg2 = 1.25, alpha = 0.05, power = NULL)
#  Power analysis for Multileve model Multisite randomized trials with 2 arms
#
#      J  n   f tau11  sg2     power alpha
#      20 45 0.5   0.5 1.25 0.8583253  0.05
#
#  NOTE: n is the number of subjects per cluster
#  URL: http://psychstat.org/mrt2arm

#For variance of treament effect
wp.mrt2arm(n = 45, f = 0.5, J = 20, tau11 = 0.5,
               sg2 = 1.25, alpha = 0.05, power = NULL, type = "variance")
#  Power analysis for Multileve model Multisite randomized trials with 2 arms
#
#     J  n   f tau11  sg2     power alpha
#    20 45 0.5   0.5 1.25 0.9987823  0.05
#
#  NOTE: n is the number of subjects per cluster
#  URL: http://psychstat.org/mrt2arm

#For testing site variablity
res<- wp.mrt2arm(n = 45, f = 0.5, J = 20, tau11 = 0.5,
                 sg2 = 1.25, alpha = 0.05, power = NULL, type = "site")
#  Power analysis for Multileve model Multisite randomized trials with 2 arms
#
#     J  n   f tau11  sg2 alpha
#    20 45 0.5   0.5 1.25  0.05
#
#  NOTE: n is the number of subjects per cluster
#  URL: http://psychstat.org/mrt2arm

#To generate a power curve given a sequence of sample sizes:
wp.mrt2arm(n = seq(10,50,5), f = 0.5, J = 20, tau11 = 0.5,
                          sg2 = 1.25, alpha = 0.05, power = NULL)
#  Power analysis for Multileve model Multisite randomized trials with 2 arms
#
#      J  n   f tau11  sg2     power alpha
#     20 10 0.5   0.5 1.25 0.6599499  0.05
#     20 15 0.5   0.5 1.25 0.7383281  0.05
#     20 20 0.5   0.5 1.25 0.7818294  0.05
#     20 25 0.5   0.5 1.25 0.8090084  0.05
#     20 30 0.5   0.5 1.25 0.8274288  0.05
#     20 35 0.5   0.5 1.25 0.8406659  0.05
#     20 40 0.5   0.5 1.25 0.8506049  0.05
#     20 45 0.5   0.5 1.25 0.8583253  0.05
#     20 50 0.5   0.5 1.25 0.8644864  0.05
#
#  NOTE: n is the number of subjects per cluster
#  URL: http://psychstat.org/mrt2arm

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.mrt2arm(n = NULL, f = 0.5, J = 20, tau11 = 0.5,
                      sg2 = 1.25, alpha = 0.05, power = 0.8)
#  Power analysis for Multileve model Multisite randomized trials with 2 arms
#
#     J        n   f tau11  sg2 power alpha
#    20 23.10086 0.5   0.5 1.25   0.8  0.05
#
#  NOTE: n is the number of subjects per cluster
#  URL: http://psychstat.org/mrt2arm
## End(No test)




