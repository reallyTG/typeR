library(WACS)


### Name: WACS
### Title: WACS: Multivariate Weather-state Approach Conditionally
###   Skew-normal Generator
### Aliases: WACS WACS-package

### ** Examples

## Not run: 
##D data(ClimateSeries)
##D ThisData = WACSdata(ClimateSeries, from="1995-01-01", to="1997-12-31")
##D ThisPar  = WACSestim(ThisData,Nclusters=1:2,plot.it=F)
##D ThisSim  = WACSsimul(ThisPar, from="1995-01-01", to="1997-12-31")
##D ThisVal  = WACSvalid(what="Sim",wacsdata = ThisData, wacspar = ThisPar, 
##D                      wacssimul = ThisSim,varname="tmin")
##D WACSplot(ThisVal)
##D 
##D  
## End(Not run)



