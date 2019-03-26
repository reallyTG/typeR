library(queueing)


### Name: Wqq.o_MMCK
### Title: Returns the mean time spend in queue when there is queue in the
###   M/M/c/K queueing model
### Aliases: Wqq.o_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Returns the Wqq
Wqq(o_mmck)



