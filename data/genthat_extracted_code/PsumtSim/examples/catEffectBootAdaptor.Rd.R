library(PsumtSim)


### Name: catEffectBootAdaptor
### Title: Adaptor for testing category effects in simulations using the
###   boot package and function.
### Aliases: catEffectBootAdaptor
### Keywords: Utilities

### ** Examples

  # Simulate 4 categories of responses and then compute the number of times
  # there would be a significant effect of a change in the categories relative
  # to background using the CBT. This would form a rough estimate of the power
  # of the CBT to detect such changes.
  library(boot)
  library(EffectsRelBaseline)
  simCatResp(1,c(1,1.5,2,1),6)->sim3
  boot(sim3,catEffectBootAdaptor,100,backMean=mean(1,1.5,2,1))->boot3
  sum(boot3$t0>boot3$t)



