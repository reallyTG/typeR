library(PreciseSums)


### Name: fsum
### Title: Return an accurate floating point sum of values
### Aliases: fsum

### ** Examples

sum(c(1,1e100,1,-1e100)) ## Should be 2, gives 0
fsum(c(1,1e100,1,-1e100)) ## Gives 2.




