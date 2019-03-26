library(queueing)


### Name: WWs
### Title: Returns the normalized mean response time in a queueing model
### Aliases: WWs
### Keywords: M/M/1/K/K

### ** Examples

## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the WWs
WWs(o_mm1kk)



