library(latentnet)


### Name: gof.ergmm
### Title: Conduct Goodness-of-Fit Diagnostics on a Exponential Family
###   Random Graph Mixed Model Fit
### Aliases: gof.ergmm gof
### Keywords: models

### ** Examples


## No test: 
#
data(sampson)
#
# test the gof.ergm function
#
samplike.fit <- ergmm(samplike ~ euclidean(d=2,G=3),
                      control=ergmm.control(burnin=1000,interval=5))
samplike.fit
summary(samplike.fit)

#
# Plot the probabilities first
#
monks.gof <- gof(samplike.fit)
monks.gof
#
# Place all three on the same page
# with nice margins
#
par(mfrow=c(1,3))
par(oma=c(0.5,2,1,0.5))
#
plot(monks.gof)
#
# And now the odds 
#
plot(monks.gof, plotlogodds=TRUE)
## End(No test)



