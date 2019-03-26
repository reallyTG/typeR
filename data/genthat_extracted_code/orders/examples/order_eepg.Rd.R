library(orders)


### Name: order_eepg
### Title: Random Sampling of Order Statistics from a Exponentiated
###   Exponential Poisson G Distribution
### Aliases: order_eepg

### ** Examples

library(orders)
# A sample of order statistics from a Exponentiated Exponential Poisson Exponential Distribution
order_eepg(10,"exp",1,1,1,50)
# A sample of order statistics from a Exponentiated Exponential Poisson Normal Distribution
order_eepg(10,"norm",1,1,1,50)
# A sample of order statistics from a Exponentiated Exponential Poisson Log-normal Distribution
order_eepg(10,"lnorm",1,1,1,50)
# A sample of order statistics from a Exponentiated Exponential Poisson Chi-square Distribution
order_eepg(10,"chisq",1,1,1,50,df=3)



