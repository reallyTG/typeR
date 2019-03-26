library(cocorresp)


### Name: weights.symcoca
### Title: Exctract CoCA model weights
### Aliases: weights.symcoca weights.predcoca
### Keywords: methods utilities

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

## weights == R[0]
weights(bp.sym)
## Don't show: 
options(od)
## End(Don't show)



