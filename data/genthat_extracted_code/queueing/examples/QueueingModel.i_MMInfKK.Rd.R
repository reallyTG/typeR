library(queueing)


### Name: QueueingModel.i_MMInfKK
### Title: Builds a M/M/Infinite/K/K queueing model
### Aliases: QueueingModel.i_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
QueueingModel(i_MMInfKK)




