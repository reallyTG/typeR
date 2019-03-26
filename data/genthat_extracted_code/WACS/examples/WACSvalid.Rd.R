library(WACS)


### Name: WACSvalid
### Title: Performs validations of WACS simulations
### Aliases: WACSvalid

### ** Examples

## Not run: 
##D   ## Simple example
##D   data(ClimateSeries)
##D   ThisData = WACSdata(ClimateSeries)
##D   ThisPar  = WACSestim(ThisData)
##D   ThisSim  = WACSsimul(ThisPar, from="1995-01-01", to="2012-12-31")
##D   Val1 = WACSvalid(what="Sim",wacsdata = ThisData, 
##D                    wacspar = ThisPar, wacssimul = ThisSim, varname="tmin")
##D   Val2 = WACSvalid(what="MeanSd",wacsdata = ThisData, 
##D                    wacssimul = ThisSim, varname="RG")
##D   Val3 = WACSvalid(what="SumBase", wacsdata = ThisData,  
##D                    wacssimul = ThisSim, varname="tmoy", base=5, month=2:5)
##D   Val4 = WACSvalid(what="Persistence",wacsdata = ThisData,  
##D                    wacssimul = ThisSim, varname="tmin", base=0, above=FALSE)
## End(Not run)



