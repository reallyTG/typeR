library(orders)


### Name: order_beg
### Title: Random Sampling of Order Statistics from a Beta Extended G
###   Distribution
### Aliases: order_beg

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Beta Extented Exponential Distribution
order_beg(10,"exp",1,1,1,1,50)
# A sample of size 10 of order statistics from a Beta Extented Normal Distribution
order_beg(10,"norm",1,1,1,1,50)
# A sample of size 10 of order statistics from a Beta Extented Log-normal Distribution
order_beg(10,"lnorm",1,1,1,1,50)
# A sample of size 10 of order statistics from a Beta Extented Chis-square Distribution
order_beg(10,"chisq",1,1,1,1,50,df=3)



