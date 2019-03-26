library(cocorresp)


### Name: corAxis
### Title: Correlation between ordination axes
### Aliases: corAxis.symcoca corAxis corAxis.default
### Keywords: univar

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## load some data
data(beetles)
data(plants)

## log transform the beetle data
beetles <- log(beetles + 1)

## symmetric Co-CA model
beetles.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## correlations between axes
corAxis(beetles.sym)
## Don't show: 
options(od)
## End(Don't show)



