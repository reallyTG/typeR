library(braidrm)


### Name: findBestHill
### Title: Fit Hill Model with Model Selection
### Aliases: findBestHill findBestHill.default findBestHill.formula
### Keywords: regression

### ** Examples

data(es8olatmz)
drv <- es8olatmz$compound2=="DMSO"
hfit <- findBestHill(es8olatmz$conc1[drv],es8olatmz$act[drv],defaults=c(0,-2.7))
coef(hfit$allfits[[hfit$bestModIdx]])
hfit <- findBestHill(act~conc1,es8olatmz[drv,],defaults=c(0,-4))
coef(hfit$allfits[[hfit$bestModIdx]])



