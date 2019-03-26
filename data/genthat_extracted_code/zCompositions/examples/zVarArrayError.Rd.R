library(zCompositions)


### Name: zVarArrayError
### Title: Variation array relative error
### Aliases: zVarArrayError

### ** Examples

data(Water)
zPatterns(Water, label = 0)
zVarArrayError(Water)
zVarArrayError(Water, breakdown = TRUE)

# From a completed data set

data(mdl) # matrix of limits of detection for Water
Water_multKM <- multKM(Water,label=0,dl=mdl) # nondetects imputation

# Results split by two ficticious groups A and B
zVarArrayError(Water_multKM,groups=rep(c("A","B"),each=50))



