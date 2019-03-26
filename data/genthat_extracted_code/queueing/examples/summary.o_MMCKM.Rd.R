library(queueing)


### Name: summary.o_MMCKM
### Title: Summary of the results of a M/M/c/K/m queueing model
### Aliases: summary.o_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## Build the model
o_mmckm <- QueueingModel(i_mmckm)

## Report the results
summary(o_mmckm)



