library(simPop)


### Name: simCategorical
### Title: Simulate categorical variables of population data
### Aliases: simCategorical
### Keywords: datagen

### ** Examples

data(eusilcS) # load sample data
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
##D ## in the following, nr_cpus are selected automatically
##D simPop <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
##D simPop <- simCategorical(simPop, additional=c("pl030", "pb220a"), method="multinom", nr_cpus=1)
##D simPop
## End(Not run)



