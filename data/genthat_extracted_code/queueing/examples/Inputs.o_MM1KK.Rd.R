library(queueing)


### Name: Inputs.o_MM1KK
### Title: Returns the input parameters of a M/M/1/K/K queueing model
### Aliases: Inputs.o_MM1KK
### Keywords: M/M/1/K/K

### ** Examples

## See example 10.13 in reference [Sixto2004] for more details.
## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Retunns the Inputs
Inputs(o_mm1kk)



