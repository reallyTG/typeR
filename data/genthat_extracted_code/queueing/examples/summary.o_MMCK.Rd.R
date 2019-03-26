library(queueing)


### Name: summary.o_MMCK
### Title: Summary of the results of a M/M/c/K queueing model
### Aliases: summary.o_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Report the results
summary(o_mmck)



