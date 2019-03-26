library(queueing)


### Name: VTq.o_MMCC
### Title: Returns the variance of the time spend in queue in the M/M/c/c
###   queueing model
### Aliases: VTq.o_MMCC
### Keywords: M/M/c/c

### ** Examples


## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
o_mmcc <- QueueingModel(i_mmcc)

## Returns the variance
VTq(o_mmcc)



