library(WACS)


### Name: WACSplot
### Title: Produces validation and/or WACS comparison plots
### Aliases: WACSplot

### ** Examples

## Not run: 
##D   ## Simple example
##D   data(ClimateSeries)
##D   ThisData = WACSdata(ClimateSeries)
##D   ThisPar  = WACSestim(ThisData)
##D   ThisSim  = WACSsimul(ThisPar, from="1995-01-01", to="2012-12-31")
##D   ThisVal  = WACSvalid(what="Sim",wacsdata = ThisData, wacspar = ThisPar, 
##D                        wacssimul = ThisSim,varname="tmin")
##D   WACSplot(ThisVal,file="ThisFile.pdf")
## End(Not run)




