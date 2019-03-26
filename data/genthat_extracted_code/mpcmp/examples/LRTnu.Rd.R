library(mpcmp)


### Name: LRTnu
### Title: Likelihood Ratio Test for nu = 1 of a COM-Poisson model
### Aliases: LRTnu

### ** Examples

data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
LRTnu(M.bids)



