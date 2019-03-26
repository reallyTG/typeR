library(PreciseSums)


### Name: neumaierSum
### Title: Using the Neumaier method, take a more accurate sum
### Aliases: neumaierSum

### ** Examples

sum(c(1,1e100,1,-1e100)) ## Should be 2, gives 0
neumaierSum(c(1,1e100,1,-1e100)) ## Gives 2



