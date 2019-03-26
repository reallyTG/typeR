library(queueing)


### Name: QueueingModel.i_MMCKM
### Title: Builds a M/M/c/K/m queueing model
### Aliases: QueueingModel.i_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## Build the model
QueueingModel(i_mmckm)




