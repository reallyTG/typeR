library(queueing)


### Name: Inputs.o_MMCK
### Title: Returns the input parameters of a M/M/c/K queueing model
### Aliases: Inputs.o_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Retunns the Inputs
Inputs(o_mmck)



