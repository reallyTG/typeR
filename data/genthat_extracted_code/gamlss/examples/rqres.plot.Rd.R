library(gamlss)


### Name: rqres.plot
### Title: Creating and Plotting Randomized Quantile Residuals
### Aliases: rqres.plot get.rqres
### Keywords: regression

### ** Examples

data(aids) # fitting a model from a discrete distribution 
h<-gamlss(y~pb(x)+qrt, family=NBI, data=aids) # 
plot(h)
# plot qq- plots from 6 realization of the randomized quantile residuals
rqres.plot(h) 
# a worm-plot of the medians from 10 realizations
rqres.plot(h,howmany=40,plot="all") # 



