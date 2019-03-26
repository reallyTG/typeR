library(queueing)


### Name: Inputs.o_MMInfKK
### Title: Returns the input parameters of a M/M/Infinite/K/K queueing
###   model
### Aliases: Inputs.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Retunns the Inputs
Inputs(o_MMInfKK)



