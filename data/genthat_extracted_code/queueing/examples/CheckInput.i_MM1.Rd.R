library(queueing)


### Name: CheckInput.i_MM1
### Title: Checks the input params of a M/M/1 queueing model
### Aliases: CheckInput.i_MM1
### Keywords: M/M/1

### ** Examples

## See example 10.3 in reference [Sixto2004] for more details.
## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Check the inputs
CheckInput(i_mm1)




