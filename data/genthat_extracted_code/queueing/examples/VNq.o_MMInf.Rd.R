library(queueing)


### Name: VNq.o_MMInf
### Title: Returns the variance of the number of customers in the queue in
###   the M/M/Infinite queueing model
### Aliases: VNq.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Returns the variance
VNq(o_mminf)



