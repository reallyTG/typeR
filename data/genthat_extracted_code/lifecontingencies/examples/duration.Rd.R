library(lifecontingencies)


### Name: duration
### Title: Functions to evaluate duration and convexity
### Aliases: duration convexity

### ** Examples

#evaluate the duration of a coupon payment
cf=c(10,10,10,10,10,110)
t=c(1,2,3,4,5,6)
duration(cf, t, i=0.03)
#and the convexity

convexity(cf, t, i=0.03)



