library(queueing)


### Name: VTq.o_MMInf
### Title: Returns the variance of the time spend in queue in the
###   M/M/Infinite queueing model
### Aliases: VTq.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Returns the variance
VTq(o_mminf)



