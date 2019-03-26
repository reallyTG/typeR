library(EffectsRelBaseline)


### Name: raceEffectBootAdaptor
### Title: Boot adaptor for testing race effect.
### Aliases: raceEffectBootAdaptor
### Keywords: multivariate

### ** Examples

  # Test for an effect of race on the neural responses in the sample data
  # using the SSC statistic. This effect is highly significant if computed while
  # averaging over all neurons in the dataset.
  require('boot')
  data(ef)
  boot(ef,raceEffectBootAdaptor,1000,useResp=TRUE, 
        testFnc=sumSqCat,backMean=mean(ef$absBkg))->bootRes
  sum(bootRes$t>bootRes$t1)/1000



