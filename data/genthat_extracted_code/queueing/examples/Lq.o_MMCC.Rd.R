library(queueing)


### Name: Lq.o_MMCC
### Title: Returns the mean number of customers in the queue in the M/M/c/c
###   queueing model
### Aliases: Lq.o_MMCC
### Keywords: M/M/c/c

### ** Examples

## See example 10.12 in reference [Sixto2004] for more details.
## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
o_mmcc <- QueueingModel(i_mmcc)

## Returns the Lq
Lq(o_mmcc)



