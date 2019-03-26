library(queueing)


### Name: Lqq.o_MMInf
### Title: Returns the mean number of customers in queue when there is
###   queue in the M/M/Infinite queueing model
### Aliases: Lqq.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Returns the Lqq
Lqq(o_mminf)



