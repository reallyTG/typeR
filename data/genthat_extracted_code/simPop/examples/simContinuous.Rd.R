library(simPop)


### Name: simContinuous
### Title: Simulate continuous variables of population data
### Aliases: simContinuous
### Keywords: datagen

### ** Examples


data(eusilcS)
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
##D simPop <- simStructure(data=inp, method="direct",
##D   basicHHvars=c("age", "rb090", "hsize", "pl030", "pb220a"))
##D 
##D regModel = ~rb090+hsize+pl030+pb220a
##D 
##D # multinomial model with random draws
##D eusilcM <- simContinuous(simPop, additional="netIncome",
##D               regModel = regModel,
##D               upper=200000, equidist=FALSE, nr_cpus=1)
##D class(eusilcM)
## End(Not run)

## Not run: 
##D # two-step regression
##D eusilcT <- simContinuous(simPop, additional="netIncome",
##D               regModel = "basic",
##D               method = "lm")
##D class(eusilcT)
## End(Not run)




