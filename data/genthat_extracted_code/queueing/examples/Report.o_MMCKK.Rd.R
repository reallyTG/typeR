library(queueing)


### Name: Report.o_MMCKK
### Title: Reports the results of a M/M/c/K/K queueing model
### Aliases: Report.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
o_mmckk <- QueueingModel(i_mmckk)

## Report the results
Report(o_mmckk)



