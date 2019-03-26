library(queueing)


### Name: CheckInput.i_MMInf
### Title: Checks the input params of a M/M/Infinite queueing model
### Aliases: CheckInput.i_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Check the parameters
CheckInput(i_mminf)




