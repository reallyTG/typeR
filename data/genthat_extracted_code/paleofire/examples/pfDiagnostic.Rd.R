library(paleofire)


### Name: pfDiagnostic
### Title: Print diagnostic pdf for individual transformed series
### Aliases: pfDiagnostic

### ** Examples

## Not run: 
##D # Select boreal sites from Levavasseur 2012 PNV in Western North America
##D ID=pfSiteSel(continent=="North America", l12==1, long>=-160 & long<=-140)
##D 
##D # Print a diagnostic pdf for Box-Cox, Smoothed and Z-score tranformed data
##D # (base period = 200-2000 BP)
##D pfDiagnostic(ID,method=c("Box-Cox", "SmoothSpline","Z-Score"),
##D              span=0.3,BasePeriod=c(200,4000))
##D 
## End(Not run)



