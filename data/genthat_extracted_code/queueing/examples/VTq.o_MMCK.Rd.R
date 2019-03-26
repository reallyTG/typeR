library(queueing)


### Name: VTq.o_MMCK
### Title: Returns the variance of the time spend in queue in the M/M/c/K
###   queueing model
### Aliases: VTq.o_MMCK
### Keywords: M/M/c/K

### ** Examples


## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Returns the variance
VTq(o_mmck)



