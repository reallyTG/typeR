library(mixR)


### Name: initz
### Title: Initialization of EM Algorithm
### Aliases: initz

### ** Examples

x <- rmixnormal(500, c(0.5, 0.5), c(2, 5), c(1, 0.7))
data <- bin(x, seq(-2, 8, 0.25))
par1 <- initz(x, 2)
par2 <- initz(data, 2)




