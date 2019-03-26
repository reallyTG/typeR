library(queueing)


### Name: CheckInput.i_MMCKM
### Title: Checks the input params of a M/M/c/K/m queueing model
### Aliases: CheckInput.i_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## check the parameters
CheckInput(i_mmckm)




