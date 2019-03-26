library(simPop)


### Name: simComponents
### Title: Simulate components of continuous variables of population data
### Aliases: simComponents
### Keywords: datagen

### ** Examples

data(eusilcS)
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize",
##D   strata="db040", weight="db090")
##D simPopObj <- simStructure(data=inp, method="direct",
##D   basicHHvars=c("age", "rb090", "hsize", "pl030", "pb220a"))
##D simPopObj <- simContinuous(simPopObj, additional = "netIncome",
##D   regModel = ~rb090+hsize+pl030+pb220a+hsize,
##D   method="multinom", upper=200000, equidist=FALSE, nr_cpus=1)
##D 
##D # categorize net income for use as conditioning variable
##D sIncome <- manageSimPopObj(simPopObj, var="netIncome", sample=TRUE, set=FALSE)
##D sWeight <- manageSimPopObj(simPopObj, var="rb050", sample=TRUE, set=FALSE)
##D pIncome <- manageSimPopObj(simPopObj, var="netIncome", sample=FALSE, set=FALSE)
##D 
##D breaks <- getBreaks(x=unlist(sIncome), w=unlist(sWeight), upper=Inf, equidist=FALSE)
##D simPopObj <- manageSimPopObj(simPopObj, var="netIncomeCat", sample=TRUE,
##D   set=TRUE, values=getCat(x=unlist(sIncome), breaks))
##D simPopObj <- manageSimPopObj(simPopObj, var="netIncomeCat", sample=FALSE,
##D   set=TRUE, values=getCat(x=unlist(pIncome), breaks))
##D 
##D # simulate net income components
##D simPopObj <- simComponents(simPopObj=simPopObj, total="netIncome",
##D   components=c("py010n","py050n","py090n","py100n","py110n","py120n","py130n","py140n"),
##D   conditional = c("netIncomeCat", "pl030"), replaceEmpty = "sequential", seed=1 )
##D 
##D class(simPopObj)
## End(Not run)



