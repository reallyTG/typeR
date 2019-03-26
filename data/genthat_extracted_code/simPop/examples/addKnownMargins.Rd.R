library(simPop)


### Name: addKnownMargins
### Title: add known margins/totals
### Aliases: addKnownMargins
### Keywords: manip

### ** Examples

data(eusilcS)
data(eusilcP)
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
##D inp <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
##D inp <- simCategorical(inp, additional=c("pl030", "pb220a"), method="multinom",nr_cpus=1)
##D 
##D margins <- as.data.frame(
##D   xtabs(rep(1, nrow(eusilcP)) ~ eusilcP$region + eusilcP$gender + eusilcP$citizenship))
##D colnames(margins) <- c("db040", "rb090", "pb220a", "freq")
##D inp <- addKnownMargins(inp, margins)
##D str(inp)
## End(Not run)



