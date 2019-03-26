library(orders)


### Name: order_expkumg
### Title: Random Sampling of Order Statistics from a Exponentiated
###   Kumaraswamy G Distribution
### Aliases: order_expkumg

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Exponentiated Kumaraswamy Exponential Distribution
order_expkumg(10,"exp",1,1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Kumaraswamy Normal Distribution
order_expkumg(10,"norm",1,1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Kumaraswamy Log-normal Distribution
order_expkumg(10,"lnorm",1,1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Kumaraswamy Chi-square Distribution
order_expkumg(10,"chisq",1,1,1,1,50,df=3)



