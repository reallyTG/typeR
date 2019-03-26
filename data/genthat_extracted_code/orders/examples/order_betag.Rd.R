library(orders)


### Name: order_betag
### Title: Random Sampling of Order Statistics from a Beta G Distribution
### Aliases: order_betag

### ** Examples

library(orders)
# A sample of size 10 of order statistics from a Beta Exponential Distribution
order_betag(10,"exp",1,1,1,50)
# A sample of size 10 of order statistics from a Beta Normal Distribution
order_betag(10,"norm",1,1,1,50)
# A sample of size 10 of order statistics from a Beta Log-normal Distribution
order_betag(10,"lnorm",1,1,1,50)
# A sample of size 10 of order statistics from a Beta Chis-square Distribution
order_betag(10,"chisq",1,1,1,50,df=3)



