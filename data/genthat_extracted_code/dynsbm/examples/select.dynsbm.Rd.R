library(dynsbm)


### Name: select.dynsbm
### Title: Dynamic stochastic block model estimation for different number
###   of groups.
### Aliases: select.dynsbm

### ** Examples

data(simdataT5Q4N40binary)

## estimation for Q=1..6 groups
list.dynsbm <- select.dynsbm(simdataT5Q4N40binary, 
				Qmin=1, Qmax=6, edge.type="binary", nstart=1)
				
## Not run: 
##D ## better to use nstart>1 starting points
##D ## but estimation can take 1-2 minutes
##D list.dynsbm <- select.dynsbm(simdataT5Q4N40binary, 
##D 				Qmin=1, Qmax=6, edge.type="binary", nstart=25)
## End(Not run)

## selection of Q=4
dynsbm <- list.dynsbm[[4]]

## plotting intra/inter connectivity patterns
connectivity.plot(dynsbm, simdataT5Q4N40binary)

## plotting switches between groups
alluvial.plot(dynsbm)



