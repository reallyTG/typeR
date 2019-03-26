library(cocorresp)


### Name: summary.predcoca
### Title: Summarizing Co-CA Model Fits
### Aliases: summary.predcoca print.summary.predcoca summary.symcoca
###   print.summary.symcoca
### Keywords: multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## symmetric CoCA
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")
## No test: 
summary(bp.sym, axes = 1:4)
## End(No test)

## Different scaling
## No test: 
summary(bp.sym, axes = 1:4, scaling = 2)
## End(No test)

## Predictive CoCA
bp.pred <- coca(beetles ~ ., data = plants)
## No test: 
summary(bp.pred, axes = 1:2)
## End(No test)
## Don't show: 
options(od)
## End(Don't show)



