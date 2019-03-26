library(mpcmp)


### Name: cmplrtest
### Title: Likelihood Ratio Test for nested COM-Poisson models
### Aliases: cmplrtest

### ** Examples

data(takeoverbids)

## Fit full model 
M.bids.full <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
    
## Fit null model; without whtknght
M.bids.null <- update(M.bids.full, .~.-whtknght)     
    
## Likelihood ratio test for the nested models
cmplrtest(M.bids.full, M.bids.null) # order of objects is not important




