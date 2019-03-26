library(queueing)


### Name: Inputs.o_MMInf
### Title: Returns the input parameters of a M/M/Infinite queueing model
### Aliases: Inputs.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Retunns the Inputs
Inputs(o_mminf)



