library(queueing)


### Name: QueueingModel.i_MMInf
### Title: Builds a M/M/Infinite queue model
### Aliases: QueueingModel.i_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
QueueingModel(i_mminf)




