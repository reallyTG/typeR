library(mpcmp)


### Name: update.cmp
### Title: Update and Re-fit a COM-Poisson Model
### Aliases: update.cmp

### ** Examples

data(takeoverbids)

## Fit full model 
M.bids.full <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
M.bids.full
        
## Dropping whtknght
M.bids.null <- update(M.bids.full, .~.-whtknght)
M.bids.null




