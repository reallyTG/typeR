library(queueing)


### Name: CheckInput
### Title: Generic S3 method to check the params of a queueing model (or
###   network)
### Aliases: CheckInput
### Keywords: Queueing Models

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Check the inputs
CheckInput(i_mm1)




