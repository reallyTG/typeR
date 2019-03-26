library(zCompositions)


### Name: zVarArray
### Title: Variation array for grouped data
### Aliases: zVarArray

### ** Examples

data(Water)
zPatterns(Water, label = 0)
zVarArray(Water)

# From a completed data set

data(mdl) # matrix of limits of detection for Water
Water_multKM <- multKM(Water,label=0,dl=mdl) # nondetects imputation

# Results split by two ficticious groups A and B
zVarArray(Water_multKM,groups=rep(c("A","B"),each=50))



