library(CDM)


### Name: IRT.modelfit
### Title: S3 Methods for Assessing Model Fit
### Aliases: IRT.modelfit IRT.modelfit.din IRT.modelfit.gdina
###   summary.IRT.modelfit.din summary.IRT.modelfit.gdina

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Absolute model fit
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #*** Model 1: DINA model for DINA simulated data
##D mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix, rule="DINA" )
##D fmod1 <- CDM::IRT.modelfit( mod1 )
##D summary(fmod1)
##D   ##  Test of Global Model Fit
##D   ##         type value     p
##D   ##  1   max(X2) 8.728 0.113
##D   ##  2 abs(fcor) 0.143 0.080
##D   ##
##D   ##  Fit Statistics
##D   ##                    est
##D   ##  MADcor          0.030
##D   ##  SRMSR           0.040
##D   ##  100*MADRESIDCOV 0.671
##D   ##  MADQ3           0.062
##D   ##  MADaQ3          0.059
##D 
##D #*** Model 2: GDINA model
##D mod2 <- CDM::gdina( sim.dina, q.matrix=sim.qmatrix, rule="GDINA" )
##D fmod2 <- CDM::IRT.modelfit( mod2 )
##D summary(fmod2)
##D   ##  Test of Global Model Fit
##D   ##         type value p
##D   ##  1   max(X2) 2.397 1
##D   ##  2 abs(fcor) 0.078 1
##D   ##
##D   ##  Fit Statistics
##D   ##                    est
##D   ##  MADcor          0.023
##D   ##  SRMSR           0.030
##D   ##  100*MADRESIDCOV 0.515
##D   ##  MADQ3           0.075
##D   ##  MADaQ3          0.071
## End(Not run)



