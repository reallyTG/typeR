library(queueing)


### Name: Inputs.o_MMCC
### Title: Returns the input parameters of a M/M/c/c queueing model
### Aliases: Inputs.o_MMCC
### Keywords: M/M/c/c

### ** Examples

## See example 10.12 in reference [Sixto2004] for more details.
## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
o_mmcc <- QueueingModel(i_mmcc)

## Retunns the Inputs
Inputs(o_mmcc)



