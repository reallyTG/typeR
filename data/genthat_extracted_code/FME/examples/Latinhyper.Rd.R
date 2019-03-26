library(FME)


### Name: Latinhyper
### Title: Latin Hypercube Sampling
### Aliases: Latinhyper
### Keywords: utilities

### ** Examples

## 4 parameters
parRange <- data.frame(min = c(0, 1, 2, 3), max = c(10, 9, 8, 7))
rownames(parRange) <- c("par1", "par2", "par3", "par4")

## Latin hypercube
pairs(Latinhyper(parRange, 100), main = "Latin hypercube")



