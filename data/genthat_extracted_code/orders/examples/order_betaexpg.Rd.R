library(orders)


### Name: order_betaexpg
### Title: Random Sampling of Order Statistics from a Beta Exponential G
###   Distribution
### Aliases: order_betaexpg

### ** Examples

library(orders)
# A sample of order statistics from a Beta Exp Exponential Distribution
order_betaexpg(10,"exp",1,1,1,1,50)
# A sample of order statistics from a Beta Exp Normal Distribution
order_betaexpg(10,"norm",1,1,1,1,50)
# A sample of order statistics from a Beta Exp Log-normal Distribution
order_betaexpg(10,"lnorm",1,1,1,1,50)
# A sample of order statistics from a Beta Exp Chi-square  Distribution
order_betaexpg(10,"chisq",1,1,1,1,50,df=3)



