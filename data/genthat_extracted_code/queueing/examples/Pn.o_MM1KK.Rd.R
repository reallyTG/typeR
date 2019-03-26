library(queueing)


### Name: Pn.o_MM1KK
### Title: Returns the probabilities of a M/M/1/K/K queueing model
### Aliases: Pn.o_MM1KK Qn.o_MM1KK
### Keywords: M/M/1/K/K

### ** Examples

## See example 10.13 in reference [Sixto2004] for more details.
## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the probabilities
Pn(o_mm1kk)
Qn(o_mm1kk)



