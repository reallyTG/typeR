library(queueing)


### Name: Pn.o_MM1
### Title: Returns the probabilities of a M/M/1 queueing model
### Aliases: Pn.o_MM1 Qn.o_MM1
### Keywords: M/M/1

### ** Examples

## See example 10.3 in reference [Sixto2004] for more details.
## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the probabilities
Pn(o_mm1)
Qn(o_mm1)




