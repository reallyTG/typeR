library(fishmethods)


### Name: sbpr
### Title: Spawning Stock Biomass-Per-Recruit Analysis
### Aliases: sbpr
### Keywords: misc

### ** Examples

data(haddock)
sbpr(age=haddock$age,ssbwgt=haddock$ssbwgt,partial=haddock$partial,
pmat=haddock$pmat,M=0.2,pF=0.2, pM=0.1667,MSP=30,plus=FALSE,maxF=2,
incrF=0.001)		



