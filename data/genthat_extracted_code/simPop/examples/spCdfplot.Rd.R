library(simPop)


### Name: spCdfplot
### Title: Plot weighted cumulative distribution functions
### Aliases: spCdfplot spCdfplot.default prepanelSpCdfplot panelSpCdfplot
###   getCdf prepCdf prepCdf.data.frame prepCdf.default panelSpCdfplot
###   prepanelSpCdfplot getCdf prepCdf prepCdf.data.frame prepCdf.default
### Keywords: hplot internal

### ** Examples

## these take some time and are not run automatically
## copy & paste to the R command line

set.seed(1234)  # for reproducibility
data(eusilcS)   # load sample data
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize",
##D   strata="db040", weight="db090")
##D simPop <- simStructure(data=inp, method="direct",
##D   basicHHvars=c("age", "rb090", "hsize", "pl030", "pb220a"))
##D 
##D # multinomial model with random draws
##D eusilcM <- simContinuous(simPop, additional="netIncome",
##D   regModel = ~rb090+hsize+pl030+pb220a,
##D   upper=200000, equidist=FALSE, nr_cpus=1)
##D class(eusilcM)
##D 
##D # plot results
##D spCdfplot(eusilcM, "netIncome", cond=NULL)
##D spCdfplot(eusilcM, "netIncome", cond="rb090", layout=c(1,2))
## End(Not run)



