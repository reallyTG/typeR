library(WACS)


### Name: WACScompare
### Title: Performs comparisons between two WACS data structures, or
###   between two WACS simulation series
### Aliases: WACScompare

### ** Examples

## Not run: 
##D   ## Simple example
##D   data(ClimateSeries)
##D   ThisData = WACSdata(ClimateSeries,from="1995-01-01", to="2005-12-31")
##D   ThisPar  = WACSestim(ThisData)
##D   ThatData = WACSdata(ClimateSeries,from="2002-01-01", to="2012-12-31")
##D   Comp = WACScompare(what="Sim", wacs1=ThisData, wacspar=ThisPar,
##D                      wacs2=ThatData, varname="tmin")
##D   WACSplot(Comp)
##D   Comp = WACScompare(what="MeanSd",wacs1=ThisData, wacspar=ThisPar,
##D                      wacs2=ThatData, varname="RG")
##D   WACSplot(Comp)
##D   Comp = WACScompare(what="SumBase", wacs1=ThisData, wacspar=ThisPar,
##D                      wacs2=ThatData, varname="tmoy", base=5, months=2:5)
##D   WACSplot(Comp)
##D   Comp = WACScompare(what="Persistence",wacs1=ThisData, wacspar=ThisPar,
##D                      wacs2=ThatData, varname="tmin", base=0, above=FALSE)
##D   WACSplot(Comp)
## End(Not run)
 



