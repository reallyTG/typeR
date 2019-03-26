library(tdROC)


### Name: plot.tdROC
### Title: Plot the time-dependent ROC curve
### Aliases: plot.tdROC

### ** Examples

library( survival )
data( mayo );
dat <- mayo[ , c( "time","censor","mayoscore5" )] ;
fm <- tdROC( X = dat$mayoscore5, Y = dat$time, delta = dat$censor,
             tau = 365*6, span = 0.1, nboot = 0, alpha = 0.05, n.grid = 1000, cut.off = 5:9 )
# plot the object "fm" from tdR0C()
plot.tdROC( fm ) ;




