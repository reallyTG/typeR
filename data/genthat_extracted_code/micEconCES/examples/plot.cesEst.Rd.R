library(micEconCES)


### Name: plot.cesEst
### Title: Plot RSSs of a CES Function Estimated by Grid Search
### Aliases: plot.cesEst
### Keywords: models regression nonlinear

### ** Examples

   data( germanFarms, package = "micEcon" )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of intermediate inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput

   ## CES: Land & Intermediate Inputs
   cesLandInt <- cesEst( yName = "qOutput",
      xNames = c( "land", "qVarInput" ), data = germanFarms,
      rho = seq( from = -0.6, to = 0.9, by = 0.3 ) )

   # plot the rhos against the sum of squared residuals
   plot( cesLandInt ) 



