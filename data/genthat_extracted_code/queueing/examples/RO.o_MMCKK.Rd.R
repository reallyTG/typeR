library(queueing)


### Name: RO.o_MMCKK
### Title: Reports the server use of a M/M/c/K/K queueing model
### Aliases: RO.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
o_mmckk <- QueueingModel(i_mmckk)

## Report the use of the server
RO(o_mmckk)



