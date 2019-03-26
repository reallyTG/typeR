library(queueing)


### Name: L.o_MMCKM
### Title: Returns the mean number of customers in the M/M/c/K/m queueing
###   model
### Aliases: L.o_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## Build the model
o_mmckm <- QueueingModel(i_mmckm)

## Returns the L
L(o_mmckm)



