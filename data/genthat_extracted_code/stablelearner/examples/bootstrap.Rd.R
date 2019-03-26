library(stablelearner)


### Name: bootstrap
### Title: Sampler Infrastructure for Stability Assessment
### Aliases: bootstrap samplesplitting jackknife subsampling splithalf
### Keywords: regression

### ** Examples


set.seed(0)

## bootstrap sampler
s <- bootstrap(3)
s$sampler(10)

## subsampling
s <- subsampling(3, v = 0.6)
s$sampler(10)

## 5-fold sample-splitting
s <- samplesplitting(5)
s$sampler(10)

## jackknife
s <- jackknife(d = 1)
s$sampler(10)

## splithaf
s <- splithalf(3)
s$sampler(10)




