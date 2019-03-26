library(orders)


### Name: order_gammag
### Title: Random Sampling of Order Statistics from a Gamma Uniform G
###   Distribution
### Aliases: order_gammag

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Gamma Uniform Exponential Distribution
order_gammag(10,"exp",1,1,50)
# A sample of size 10 of order statistics from a Gamma Uniform Normal Distribution
order_gammag(10,"norm",1,1,50)
# A sample of size 10 of order statistics from a Gamma Uniform Log-normal Distribution
order_gammag(10,"lnorm",1,1,50)
# A sample of size 10 of order statistics from a Gamma Uniform Chi-square Distribution
order_gammag(10,"chisq",1,1,50,df=3)



