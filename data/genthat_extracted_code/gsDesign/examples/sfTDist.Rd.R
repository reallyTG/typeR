library(gsDesign)


### Name: sfTDist
### Title: 4.8: t-distribution Spending Function
### Aliases: sfTDist
### Keywords: design

### ** Examples

# 3-parameter specification: a,  b,  df
sfTDist(1, 1:5/6, c(-1, 1.5, 4))$spend

# 5-parameter specification fits 2 points,  in this case
# the 1st 2 interims are at 25% and 50% of observations with
# cumulative error spending of 10% and 20%, respectively
# final parameter is df
sfTDist(1, 1:3/4, c(.25, .5, .1, .2, 4))$spend

# 6-parameter specification fits 3 points
# Interims are at 25%. 50% and 75% of observations
# with cumulative spending of 10%, 20% and 50%, respectively
# Note: not all 3 point combinations can be fit
sfTDist(1, 1:3/4, c(.25, .5, .75, .1, .2, .5))$spend

# Example of error message when the 3-points specified 
# in the 6-parameter version cannot be fit
try(sfTDist(1, 1:3/4, c(.25, .5, .75, .1, .2, .3))$errmsg)

# sfCauchy (sfTDist with 1 df) and sfNormal (sfTDist with infinite df)
# show the limits of what sfTdist can fit 
# for the third point are u3 from 0.344 to 0.6 when t3=0.75
sfNormal(1, 1:3/4, c(.25, .5, .1, .2))$spend[3]
sfCauchy(1, 1:3/4, c(.25, .5, .1, .2))$spend[3]

# plot a few t-distribution spending functions fitting
# t=0.25, .5 and u=0.1, 0.2
# to demonstrate the range of flexibility
t <- 0:100/100
plot(t, sfTDist(0.025, t, c(.25, .5, .1, .2, 1))$spend, 
    xlab="Proportion of final sample size", 
    ylab="Cumulative Type I error spending", 
    main="t-Distribution Spending Function Examples", type="l")
lines(t, sfTDist(0.025, t, c(.25, .5, .1, .2, 1.5))$spend, lty=2)
lines(t, sfTDist(0.025, t, c(.25, .5, .1, .2, 3))$spend, lty=3)
lines(t, sfTDist(0.025, t, c(.25, .5, .1, .2, 10))$spend, lty=4)
lines(t, sfTDist(0.025, t, c(.25, .5, .1, .2, 100))$spend, lty=5)
legend(x=c(.0, .3), y=.025*c(.7, 1), lty=1:5, 
    legend=c("df = 1", "df = 1.5", "df = 3", "df = 10", "df = 100"))



