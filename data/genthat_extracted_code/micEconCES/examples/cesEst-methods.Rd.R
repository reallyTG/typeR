library(micEconCES)


### Name: cesEst-methods
### Title: Methods for Estimated CES Functions
### Aliases: coef.cesEst coef.summary.cesEst fitted.cesEst residuals.cesEst
###   vcov.cesEst
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of intermediate inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput


   ## CES: Land & Labor
   cesLandLabor <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms )

   # estimated coefficients
   coef( cesLandLabor )

   # estimated coefficients, their standard errors, t-statistic, P-values
   coef( summary( cesLandLabor ) )

   # fitted values of the estimated model
   fitted( cesLandLabor )

   # residuals of the estimated model
   residuals( cesLandLabor )

   # covariance matrix of the estimated coefficients
   vcov( cesLandLabor )



