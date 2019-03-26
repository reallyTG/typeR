library(aster)


### Name: reaster
### Title: Aster Models with Random Effects
### Aliases: reaster reaster.default reaster.formula
### Keywords: models regression

### ** Examples

library(aster)
data(radish)
pred <- c(0,1,2)
fam <- c(1,3,2)
rout <- reaster(resp ~ varb + fit : (Site * Region),
    list(block = ~ 0 + fit : Block, pop = ~ 0 + fit : Pop),
    pred, fam, varb, id, root, data = radish)
summary(rout)
summary(rout, stand = FALSE, random = TRUE)



