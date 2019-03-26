library(queueing)


### Name: VT.o_MM1KK
### Title: Returns the variance of the time spend in the M/M/1/K/K queueing
###   model
### Aliases: VT.o_MM1KK
### Keywords: M/M/1/K/K

### ** Examples


## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the variance
VT(o_mm1kk)



