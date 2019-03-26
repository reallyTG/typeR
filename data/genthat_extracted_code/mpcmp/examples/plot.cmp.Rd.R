library(mpcmp)


### Name: plot.cmp
### Title: Plot Diagnostic for a 'glm.cmp' Object
### Aliases: plot.cmp

### ** Examples

data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)

## The default plots are shown
plot(M.bids)

## The plots for the non-randomzied PIT 
# plot(M.bids, which = c(2,3))



