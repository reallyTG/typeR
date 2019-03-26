library(mpcmp)


### Name: rPIT
### Title: Random Normal Probability Integral Transform
### Aliases: rPIT compnormRandPIT

### ** Examples

data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
compnormRandPIT(M.bids)



