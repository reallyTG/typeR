library(queueing)


### Name: QueueingModel.i_MMCC
### Title: Builds a M/M/c/c queueing model
### Aliases: QueueingModel.i_MMCC
### Keywords: M/M/c/c

### ** Examples

## See example 10.12 in reference [Sixto2004] for more details.
## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
QueueingModel(i_mmcc)




