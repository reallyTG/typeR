library(queueing)


### Name: CheckInput.i_MMCC
### Title: Checks the input params of a M/M/c/c queueing model
### Aliases: CheckInput.i_MMCC
### Keywords: M/M/c/c

### ** Examples

## See example 10.12 in reference [Sixto2004] for more details.
## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## check the parameters
CheckInput(i_mmcc)




