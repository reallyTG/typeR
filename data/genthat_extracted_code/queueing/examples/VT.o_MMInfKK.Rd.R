library(queueing)


### Name: VT.o_MMInfKK
### Title: Returns the variance of the time spend in the M/M/Infinite/K/K
###   queueing model
### Aliases: VT.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the variance
VT(o_MMInfKK)



