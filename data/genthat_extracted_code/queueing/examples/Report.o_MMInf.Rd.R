library(queueing)


### Name: Report.o_MMInf
### Title: Reports the results of a M/M/Infinite queueing model
### Aliases: Report.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Report the results
Report(o_mminf)



