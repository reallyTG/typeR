library(queueing)


### Name: RO.o_MMInf
### Title: Reports the server use of a M/M/Infinite queueing model
### Aliases: RO.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Report the use of the server
RO(o_mminf)



