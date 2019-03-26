library(orders)


### Name: order_expg
### Title: Random Sampling of Order Statistics from a Exponentiated G
###   Distribution
### Aliases: order_expg

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Exponentiated Exponential Distribution
order_expg(10,"exp",1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Normal Distribution
order_expg(10,"norm",1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Log-normal Distribution
order_expg(10,"lnorm",1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Chi-square Distribution
order_expg(10,"chisq",1,1,50,df=3)



