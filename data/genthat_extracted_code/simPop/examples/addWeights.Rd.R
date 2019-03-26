library(simPop)


### Name: addWeights<-
### Title: Methods for function 'addWeights'
### Aliases: addWeights<- addWeights addWeights<-,dataObj-method
###   addWeights<-,simPopObj-method

### ** Examples

data(eusilcS)
data(totalsRG)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
## Not run: 
##D ## approx. 20 seconds ...
##D addWeights(inp) <- calibSample(inp, totalsRG)
## End(Not run)



