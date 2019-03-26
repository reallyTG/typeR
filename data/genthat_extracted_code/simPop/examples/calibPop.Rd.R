library(simPop)


### Name: calibPop
### Title: Calibration of 0/1 weights by Simulated Annealing
### Aliases: calibPop
### Keywords: datasets

### ** Examples

data(eusilcS) # load sample data
data(eusilcP) # population data
## Not run: 
##D ## approx. 20 seconds computation time
##D inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
##D simPop <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
##D simPop <- simCategorical(simPop, additional=c("pl030", "pb220a"), method="multinom", nr_cpus=1)
##D 
##D # add margins
##D margins <- as.data.frame(
##D   xtabs(rep(1, nrow(eusilcP)) ~ eusilcP$region + eusilcP$gender + eusilcP$citizenship))
##D colnames(margins) <- c("db040", "rb090", "pb220a", "freq")
##D simPop <- addKnownMargins(simPop, margins)
##D simPop_adj2 <- calibPop(simPop, split="db040", temp=1, eps.factor=0.1,memory=TRUE)
## End(Not run)
# apply simulated annealing
## Not run: 
##D ## long computation time
##D simPop_adj <- calibPop(simPop, split="db040", temp=1, eps.factor=0.1,memory=FALSE)
## End(Not run)



