library(RobExtremes)


### Name: ismevgpdgevdiag-methods
### Title: Methods for Diagnostic Functions in Package 'RobExtremes'
### Aliases: gpd.diag gev.diag gpd.prof gev.prof gpd.profxi gev.profxi
###   gpd.diag-methods gev.diag-methods gpd.profxi-methods
###   gev.profxi-methods gpd.diag,GPDEstimate-method
###   gpd.diag,gpd.fit-method gev.diag,GEVEstimate-method
###   gev.diag,gev.fit-method gpd.prof,GPDEstimate-method
###   gpd.prof,gpd.fit-method gev.prof,GEVEstimate-method
###   gev.prof,gev.fit-method gpd.profxi,GPDEstimate-method
###   gpd.profxi,gpd.fit-method gev.profxi,GEVEstimate-method
###   gev.profxi,gev.fit-method
### Keywords: graphics

### ** Examples

if(require(ismev)){
  ## from ismev
  data(portpirie)
  data(rain)

  detach(package:ismev)
  ppfit <- ismev::gev.fit(portpirie[,2])
  gev.diag(ppfit)
  ##
  (mlE <- MLEstimator(portpirie[,2], GEVFamilyMuUnknown(withPos=FALSE)))
  gev.diag(mlE)

## No test: 
  ## not tested on CRAN because it takes some time...
  gev.prof(mlE, m = 10, 4.1, 5)
  gev.profxi(mlE, -0.3, 0.3)

  rnfit <- ismev::gpd.fit(rain,10)
  gpd.diag(rnfit)
  ##
  mlE2 <- MLEstimator(rain[rain>10], GParetoFamily(loc=10))
  gpd.diag(mlE2)

  gpd.prof(mlE2, m = 10, 55, 77)
  gpd.profxi(mlE2, -0.02, 0.02)
## End(No test)
}



