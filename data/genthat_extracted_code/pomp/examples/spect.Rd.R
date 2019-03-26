library(pomp)


### Name: Power spectrum computation and matching
### Title: Power spectrum computation and spectrum-matching for
###   partially-observed Markov processes
### Aliases: 'Power spectrum computation and matching' 'power spectrum
###   computation and matching' spect spect,pomp-method spect-pomp
###   spect,ANY-method spect,missing-method spect,spect.pomp-method
###   spect-spect.pomp spect.match spect.match,ANY-method
###   spect.match,missing-method spect.match,pomp-method spect.match-pomp
###   spect.match,spect.pomp-method spect.match-spect.pomp
###   spect.match,spect.matched.pomp-method spect.match-spect.matched.pomp
###   spect.pomp-class spect.matched.pomp-class
### Keywords: optimize ts

### ** Examples

pompExample(ou2)
good <- spect(
              ou2,
              vars=c("y1","y2"),
              kernel.width=3,
              detrend="mean",
              nsim=500
              )
summary(good)
plot(good)

ou2.bad <- ou2
coef(ou2.bad,c("x1.0","x2.0","alpha.1","alpha.4")) <- c(0,0,0.1,0.2)
bad <- spect(
             ou2.bad,
             vars=c("y1","y2"),
             kernel.width=3,
             detrend="mean",
             nsim=500
             )
summary(bad)
plot(bad)



