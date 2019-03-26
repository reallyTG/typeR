library(queueing)


### Name: CheckInput.i_MMCK
### Title: Checks the input params of a M/M/c/K queueing model
### Aliases: CheckInput.i_MMCK
### Keywords: M/M/c/K

### ** Examples

## See example 10.11 in reference [Sixto2004] for more details.
## create input parameters
i_mmck <- NewInput.MMCK(lambda=8, mu=4, c=5, k=12)

## Check the inputs
CheckInput(i_mmck)




