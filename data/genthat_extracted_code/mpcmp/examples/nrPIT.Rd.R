library(mpcmp)


### Name: nrPIT
### Title: Non-randomized Probability Integral Transform
### Aliases: nrPIT compPredProb compPIT

### ** Examples

data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
compPredProb(M.bids)
compPIT(M.bids)



