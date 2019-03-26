library(queueing)


### Name: SP
### Title: Returns the saturation point of a queueing model
### Aliases: SP
### Keywords: M/M/1/K/K

### ** Examples

## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=4, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the saturation point
SP(o_mm1kk)




