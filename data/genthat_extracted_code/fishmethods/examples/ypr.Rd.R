library(fishmethods)


### Name: ypr
### Title: Yield-Per-Recruit Analysis
### Aliases: ypr
### Keywords: misc

### ** Examples

data(haddock)
ypr(age=haddock$age,wgt=haddock$ssbwgt,partial=haddock$partial,M=0.4,
plus=TRUE,oldest=100,maxF=2,incrF=0.01)



