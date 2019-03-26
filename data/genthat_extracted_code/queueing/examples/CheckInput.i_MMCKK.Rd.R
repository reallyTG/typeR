library(queueing)


### Name: CheckInput.i_MMCKK
### Title: Checks the input params of a M/M/c/K/K queueing model
### Aliases: CheckInput.i_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## check the parameters
CheckInput(i_mmckk)




