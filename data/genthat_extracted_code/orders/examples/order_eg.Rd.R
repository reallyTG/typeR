library(orders)


### Name: order_eg
### Title: Random Sampling of Order Statistics from a Exponentiated
###   Generalized G Distribution
### Aliases: order_eg

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Exponentiated Generalized Exponential Distribution
order_eg(10,"exp",1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Generalized Normal Distribution
order_eg(10,"norm",1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Generalized Log-normal Distribution
order_eg(10,"lnorm",1,1,1,50)
# A sample of size 10 of order statistics from a Exponentiated Generalized Chi-square Distribution
order_eg(10,"chisq",1,1,1,50,df=3)



