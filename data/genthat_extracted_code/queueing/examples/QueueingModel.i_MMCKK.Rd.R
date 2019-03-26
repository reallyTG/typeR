library(queueing)


### Name: QueueingModel.i_MMCKK
### Title: Builds a M/M/c/K/K queueing model
### Aliases: QueueingModel.i_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
QueueingModel(i_mmckk)




