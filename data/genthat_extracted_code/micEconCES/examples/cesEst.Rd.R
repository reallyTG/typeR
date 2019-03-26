library(micEconCES)


### Name: cesEst
### Title: Estimate a CES function
### Aliases: cesEst print.cesEst
### Keywords: models regression nonlinear

### ** Examples

   data( germanFarms, package = "micEcon" )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of intermediate inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput


   ## CES: Land & Labor (Levenberg-Marquardt algorithm)
   cesLandLabor <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms )

   # variable returns to scale, increased max. number of iter. (LM algorithm)
   cesLandLaborVrs <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      vrs = TRUE, control = nls.lm.control( maxiter = 1000 ) )

   # using the Nelder-Mead optimization method
   cesLandLaborNm <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "NM" )

   # using the BFGS optimization method
   cesLandLaborBfgs <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "BFGS" )

   # using the L-BFGS-B optimization method with constrained parameters
   cesLandLaborBfgsCon <- cesEst( "qOutput", c( "land", "qLabor" ),
      germanFarms, method = "L-BFGS-B" )

   # using the CG optimization method
   cesLandLaborSann <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "CG" )

   # using the SANN optimization method
   # (with decreased number of iteration to decrease execution time)
   cesLandLaborSann <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "SANN", control = list( maxit = 1000 ) )

   # using the Kmenta approximation
   cesLandLaborKmenta <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "Kmenta" )

   # using the PORT optimization routine with unconstrained parameters
   cesLandLaborPortCon <- cesEst( "qOutput", c( "land", "qLabor" ),
      germanFarms, vrs = TRUE, method = "PORT", lower = -Inf, upper = Inf )

   # using the PORT optimization routine with constrained parameters and VRS
   cesLandLaborPortCon <- cesEst( "qOutput", c( "land", "qLabor" ),
      germanFarms, vrs = TRUE, method = "PORT" )

   # using the Differential Evolution optimization method
   # (with decreased number of iteration to decrease execution time)
   cesLandLaborDe <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      method = "DE", control = DEoptim.control( itermax = 50 ) )

   ## estimation with a grid search for rho (using the LM algorithm)
   cesLandInt <- cesEst( "qOutput", c( "land", "qLabor" ),
      data = germanFarms, rho = seq( from = -0.6, to = 0.9, by = 0.3 ) )



