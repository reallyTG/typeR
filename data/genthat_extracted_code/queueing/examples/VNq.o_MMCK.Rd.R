library(queueing)


### Name: VNq.o_MMCK
### Title: Returns the variance of the number of customers in the queue in
###   the M/M/c/K queueing model
### Aliases: VNq.o_MMCK
### Keywords: M/M/c/K

### ** Examples


## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Returns the variance
VNq(o_mmck)



