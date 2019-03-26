library(queueing)


### Name: Pn
### Title: Returns the probabilities of a queueing model (or network)
### Aliases: Pn Qn
### Keywords: Queueing Models

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the probabilities
Pn(o_mm1)




