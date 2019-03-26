library(queueing)


### Name: Pn.o_MMInfKK
### Title: Returns the probabilities of a M/M/Infinite/K/K queueing model
### Aliases: Pn.o_MMInfKK Qn.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the probabilities
Pn(o_MMInfKK)
Qn(o_MMInfKK)




