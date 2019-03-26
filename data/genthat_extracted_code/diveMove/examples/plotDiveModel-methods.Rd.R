library(diveMove)


### Name: plotDiveModel-methods
### Title: Methods for plotting models of dive phases
### Aliases: plotDiveModel-methods plotDiveModel
###   plotDiveModel,diveModel,missing-method
###   plotDiveModel,numeric,numeric-method
###   plotDiveModel,TDRcalibrate,missing-method
### Keywords: methods

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)

## 'diveModel' method
dm <- getDiveModel(dcalib, 100)
plotDiveModel(dm, diveNo=100)

## 'TDRcalibrate' method
plotDiveModel(dcalib, diveNo=100)

## End(No test)




