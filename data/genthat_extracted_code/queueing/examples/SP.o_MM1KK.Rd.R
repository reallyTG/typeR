library(queueing)


### Name: SP.o_MM1KK
### Title: Returns the saturation point of a M/M/1/K/K queueing model
### Aliases: SP.o_MM1KK
### Keywords: M/M/1/K/K

### ** Examples

## See example 10.13 in reference [Sixto2004] for more details.
## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=4, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the saturation point
SP(o_mm1kk)




