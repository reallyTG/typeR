library(queueing)


### Name: RO.o_MMInfKK
### Title: Reports the server use of a M/M/Infinite/K/K queueing model
### Aliases: RO.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Report the use of the server
RO(o_MMInfKK)



