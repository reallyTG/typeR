library(FME)


### Name: Unif
### Title: Uniform Random Distribution
### Aliases: Unif
### Keywords: utilities

### ** Examples

## 4 parameters
parRange <- data.frame(min = c(0, 1, 2, 3), max = c(10, 9, 8, 7))
rownames(parRange) <- c("par1", "par2", "par3", "par4")

## uniform
pairs(Unif(parRange, 100), main = "Uniformly random")



