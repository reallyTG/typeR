library(queueing)


### Name: CheckInput.i_MMInfKK
### Title: Checks the input params of a M/M/Infinite/K/K queueing model
### Aliases: CheckInput.i_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## check the parameters
CheckInput(i_MMInfKK)




