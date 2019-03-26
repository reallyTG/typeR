library(WebPower)


### Name: wp.mrt3arm
### Title: Statistical Power Analysis for Multisite Randomized Trials with
###   3 Arms
### Aliases: wp.mrt3arm

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
#For main effect
wp.mrt3arm(n = 30, f1 = 0.43, J = 20, tau = 0.4,
               sg2 = 2.25, alpha = 0.05, power = NULL)
#    Multisite randomized trials with 3 arms
#
#       J  n   f1 tau  sg2     power alpha
#      20 30 0.43 0.4 2.25 0.8066964  0.05
#  
#    NOTE: n is the number of subjects per cluster
#    URL: http://psychstat.org/mrt3arm

#For tesing difference between effects
wp.mrt3arm(n = 30, f2 = 0.2, J = 20, tau = 0.4, sg2 = 2.25,
                      alpha = 0.05, power = NULL, type="treatment")
#    Multisite randomized trials with 3 arms
#
#      J  n  f2 tau  sg2     power alpha
#      20 30 0.2 0.4 2.25 0.2070712  0.05
# 
#    NOTE: n is the number of subjects per cluster
#    URL: http://psychstat.org/mrt3arm

#For testing site variablity
wp.mrt3arm(n = 30, f1=0.43, f2 = 0.2, J = 20, tau = 0.4, sg2 = 2.25,
                          alpha = 0.05, power = NULL, type="omnibus")
#    Multisite randomized trials with 3 arms
#
#       J  n   f1  f2 tau  sg2     power alpha
#      20 30 0.43 0.2 0.4 2.25 0.7950757  0.05
#  
#    NOTE: n is the number of subjects per cluster
#    URL: http://psychstat.org/mrt3arm

#To generate a power curve given a sequence of numbers of sites/clusters:
res <- wp.mrt3arm(n = 30, f2 = 0.2, J = seq(20,120,10), tau = 0.4,
            sg2 = 2.25, alpha = 0.05, power = NULL, type="treatment")
res
#    Multisite randomized trials with 3 arms
#
#       J  n  f2 tau  sg2     power alpha
#      20 30 0.2 0.4 2.25 0.2070712  0.05
#      30 30 0.2 0.4 2.25 0.2953799  0.05
#      40 30 0.2 0.4 2.25 0.3804554  0.05
#      50 30 0.2 0.4 2.25 0.4603091  0.05
#      60 30 0.2 0.4 2.25 0.5337417  0.05
#      70 30 0.2 0.4 2.25 0.6001544  0.05
#      80 30 0.2 0.4 2.25 0.6593902  0.05
#      90 30 0.2 0.4 2.25 0.7116052  0.05
#     100 30 0.2 0.4 2.25 0.7571648  0.05
#     110 30 0.2 0.4 2.25 0.7965644  0.05
#     120 30 0.2 0.4 2.25 0.8303690  0.05
# 
#    NOTE: n is the number of subjects per cluster
#    URL: http://psychstat.org/mrt3arm

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.mrt3arm(n = NULL, f1 = 0.43, J = 20, tau = 0.4,
                sg2 = 2.25, alpha = 0.05, power = 0.8)
#    Multisite randomized trials with 3 arms
#
#       J        n   f1 tau  sg2 power alpha
#      20 28.61907 0.43 0.4 2.25   0.8  0.05
#  
#    NOTE: n is the number of subjects per cluster
#    URL: http://psychstat.org/mrt3arm
## End(No test)




