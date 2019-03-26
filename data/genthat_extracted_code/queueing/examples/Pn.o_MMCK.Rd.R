library(queueing)


### Name: Pn.o_MMCK
### Title: Returns the probabilities of a M/M/c/K queueing model
### Aliases: Pn.o_MMCK Qn.o_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Build the model
o_mmck <- QueueingModel(i_mmck)

## Returns the probabilities
Pn(o_mmck)
Qn(o_mmck)



