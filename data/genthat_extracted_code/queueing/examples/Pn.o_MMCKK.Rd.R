library(queueing)


### Name: Pn.o_MMCKK
### Title: Returns the probabilities of a M/M/c/K/K queueing model
### Aliases: Pn.o_MMCKK Qn.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
o_mmckk <- QueueingModel(i_mmckk)

## Returns the parameters
Pn(o_mmckk)
Qn(o_mmckk)



