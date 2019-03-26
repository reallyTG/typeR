library(PsumtSim)


### Name: testCatEffectBoot
### Title: Test for an effect of category using bootstrapping.
### Aliases: testCatEffectBoot
### Keywords: nonparametric

### ** Examples

  # run simulation of responses for 4 categories and then test for category 
  # effect on response using the CBT from Steinmetz & Thorp, 2013
  simCatResp(1,c(1,1.5,2,1),6)->sim4
  testCatEffectBoot(sim4,100,sumSqCat,backMean=1)



