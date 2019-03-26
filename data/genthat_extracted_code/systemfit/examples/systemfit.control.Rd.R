library(systemfit)


### Name: systemfit.control
### Title: Create list of control parameters for systemfit
### Aliases: systemfit.control
### Keywords: models regression

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
eqSystem <- list( demand = eqDemand, supply = eqSupply )

## SUR estimation: calculation of residual covariance
## matrix without correction for degrees of freedom
fitsur <- systemfit( eqSystem, "SUR", data = Kmenta,
    control = systemfit.control( methodResidCov = "noDfCor" ) )
print( fitsur )



