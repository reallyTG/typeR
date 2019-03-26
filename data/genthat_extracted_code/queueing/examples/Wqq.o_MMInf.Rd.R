library(queueing)


### Name: Wqq.o_MMInf
### Title: Returns the mean time spend in queue when there is queue in the
###   M/M/Infinite queueing model
### Aliases: Wqq.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Returns the Wqq
Wqq(o_mminf)



