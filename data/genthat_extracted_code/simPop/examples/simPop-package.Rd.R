library(simPop)


### Name: simPop-package
### Title: Simulation of Synthetic Populations for Survey Data Considering
###   Auxiliary Information
### Aliases: simPop-package simPop
### Keywords: package

### ** Examples


## we use synthetic eusilcS survey sample data 
## included in the package to simulate a population

## create the structure
data(eusilcS)
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
##D ## in the following, nr_cpus are selected automatically
##D simPop <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
##D simPop <- simCategorical(simPop, additional=c("pl030", "pb220a"), method="multinom", nr_cpus=1)
##D simPop
##D class(simPop)
##D regModel = ~rb090+hsize+pl030+pb220a
##D 
##D ## multinomial model with random draws
##D eusilcM <- simContinuous(simPop, additional="netIncome",
##D               regModel = regModel,
##D               upper=200000, equidist=FALSE, nr_cpus=1)
##D class(eusilcM)
## End(Not run)

## this is already a basic synthetic population, but
## many other functions in the package might now 
## be used for fine-tuning, adding further variables, 
## evaluating the quality, adding finer geographical details, 
## using different methods, calibrating surveys or populations, etc. 
## -- see Templ et al. (2017) for more details.




