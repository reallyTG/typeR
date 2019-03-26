library(WebPower)


### Name: wp.regression
### Title: Statistical Power Analysis for Linear Regression
### Aliases: wp.regression

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.regression(n = 100, p1 = 3, f2 = 0.1, alpha = 0.05, power = NULL)
#  Power for multiple regression
#
#      n p1 p2  f2 alpha     power
#    100  3  0 0.1  0.05 0.7420463
#
#  URL: http://psychstat.org/regression

#To generate a power curve given a sequence of sample sizes:
res <- wp.regression(n = seq(50,300,50), p1 = 3, f2 = 0.1, 
                                 alpha = 0.05, power = NULL)
res
#  Power for multiple regression
#
#      n p1 p2  f2 alpha     power
#    50  3  0 0.1  0.05 0.4077879
#    100  3  0 0.1  0.05 0.7420463
#    150  3  0 0.1  0.05 0.9092082
#    200  3  0 0.1  0.05 0.9724593
#    250  3  0 0.1  0.05 0.9925216
#    300  3  0 0.1  0.05 0.9981375
#
#  URL: http://psychstat.org/regression

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.regression(n = NULL, p1 = 3, f2 = 0.1, alpha = 0.05, power = 0.8)
#  Power for multiple regression
#
#           n p1 p2  f2 alpha power
#    113.0103  3  0 0.1  0.05   0.8
#
#  URL: http://psychstat.org/regression

#The statistical power given sample size and effect size when controling two predictors:
wp.regression(n = 100, p1 = 3, p2 = 2, f2 = 0.1429, alpha = 0.05, power = NULL)
#  Power for multiple regression
#
#      n p1 p2     f2 alpha     power
#    100  3  2 0.1429  0.05 0.9594695
#
#  URL: http://psychstat.org/regression

# To generate a power curve given a sequence of effect sizes:
res <- wp.regression(n = 50, p1 = 3, f2 = seq(0.05,0.5,0.05),
                                  alpha = 0.05, power = NULL)
res
#  Power for multiple regression
#
#     n p1 p2   f2 alpha     power
#    50  3  0 0.05  0.05 0.2164842
#    50  3  0 0.10  0.05 0.4077879
#    50  3  0 0.15  0.05 0.5821296
#    50  3  0 0.20  0.05 0.7210141
#    50  3  0 0.25  0.05 0.8220164
#    50  3  0 0.30  0.05 0.8906954
#    50  3  0 0.35  0.05 0.9350154
#    50  3  0 0.40  0.05 0.9624324
#    50  3  0 0.45  0.05 0.9788077
#    50  3  0 0.50  0.05 0.9883012
#
#  URL: http://psychstat.org/regression
## End(No test)




