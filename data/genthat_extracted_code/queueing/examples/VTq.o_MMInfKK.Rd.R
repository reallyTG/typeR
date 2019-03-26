library(queueing)


### Name: VTq.o_MMInfKK
### Title: Returns the variance of the time spend in queue in the
###   M/M/Infinite/K/K queueing model
### Aliases: VTq.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the variance
VTq(o_MMInfKK)



