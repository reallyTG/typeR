library(PreciseSums)


### Name: kahanSum
### Title: Using the Kahan method, take a more accurate sum
### Aliases: kahanSum

### ** Examples

sum(c(1,1e100,1,-1e100)) ## Should be 2, gives 0
kahanSum(c(1,1e100,1,-1e100)) ## Not accurate enough for the correct result. (still = 0)



