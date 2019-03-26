library(gamlss.dist)


### Name: LQNO
### Title: Normal distribution with a specific mean and variance
###   relationship for fitting a GAMLSS model
### Aliases: LQNO dLQNO pLQNO qLQNO rLQNO
### Keywords: distribution regression

### ** Examples

LQNO()# gives information about the default links for the normal distribution
# a comparison of different Normal models
#m1 <- gamlss(y~pb(x), sigma.fo=~pb(x), data=abdom,  family=NO(mu.link="log"))
#m2 <- gamlss(y~pb(x), sigma.fo=~pb(x), data=abdom, family=LQNO)
#m3 <- gamlss(y~pb(x), sigma.fo=~pb(x), data=abdom, family=NOF(mu.link="log"))
#AIC(m1,m2,m3)



