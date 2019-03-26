library(queueing)


### Name: QueueingModel.i_MMCK
### Title: Builds a M/M/c/K queueing model
### Aliases: QueueingModel.i_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
QueueingModel(i_mmck)




