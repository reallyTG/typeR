library(dynsbm)


### Name: connectivity.plot
### Title: Plot the connectivity characteristics between groups associated
###   to a dynamic stochastic block model.
### Aliases: connectivity.plot

### ** Examples

####################
## 1 - binary case
data(simdataT5Q4N40binary)

## estimation for Q=1..5 groups
list.dynsbm <- select.dynsbm(simdataT5Q4N40binary, 
				Qmin=1, Qmax=5, edge.type="binary", nstart=1)
				
## Not run: 
##D ## better to use nstart>1 starting points
##D ## but estimation can take 1-2 minutes
##D list.dynsbm <- select.dynsbm(simdataT5Q4N40binary, 
##D 				Qmin=1, Qmax=5, edge.type="binary", nstart=25)
## End(Not run)

## selection of Q=4
dynsbm <- list.dynsbm[[4]]

## plotting intra/inter connectivity patterns
connectivity.plot(dynsbm, simdataT5Q4N40binary)

####################
## 2 - continuous case
data(simdataT5Q4N40continuous)

## estimation for Q=1..5 groups
list.dynsbm <- select.dynsbm(simdataT5Q4N40continuous, 
				Qmin=1, Qmax=5, edge.type="continuous", nstart=1)
						
## Not run: 
##D ## better to use nstart>1 starting points
##D ## but estimation can take 1-2 minutes
##D list.dynsbm <- select.dynsbm(simdataT5Q4N40continuous, 
##D 				Qmin=1, Qmax=5, edge.type="continuous", nstart=25)
## End(Not run)

## selection of Q=4
dynsbm <- list.dynsbm[[4]]

## plotting intra/inter connectivity patterns
connectivity.plot(dynsbm, simdataT5Q4N40continuous)

####################
## 3 - discrete case
data(simdataT5Q4N40discrete)

## estimation for Q=1..5 groups
list.dynsbm <- select.dynsbm(simdataT5Q4N40discrete, 
				Qmin=1, Qmax=5, edge.type="discrete", K=4, nstart=1)
									
## Not run: 
##D ## better to use nstart>1 starting points
##D ## but estimation can take 1-2 minutes
##D list.dynsbm <- select.dynsbm(simdataT5Q4N40discrete, 
##D 				Qmin=1, Qmax=5, edge.type="discrete", K=4, nstart=25)
## End(Not run)

## selection of Q=4
dynsbm <- list.dynsbm[[4]]

## plotting intra/inter connectivity patterns
connectivity.plot(dynsbm, simdataT5Q4N40discrete)



