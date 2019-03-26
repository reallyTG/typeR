library(ordinal)


### Name: VarCorr
### Title: Extract variance and correlation parameters
### Aliases: VarCorr VarCorr.clmm
### Keywords: models

### ** Examples


fm1 <- clmm(rating ~ contact + temp + (1|judge), data=wine)
VarCorr(fm1)




