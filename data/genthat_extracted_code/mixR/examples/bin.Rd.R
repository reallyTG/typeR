library(mixR)


### Name: bin
### Title: Binning the Raw Data
### Aliases: bin

### ** Examples

set.seed(99)
x <- rmixnormal(200, c(0.5, 0.5), c(2, 5), c(1, 1))
data <- bin(x, seq(-2, 10, 0.1))
fit1 <- mixfit(x, ncomp = 2)
fit2 <- mixfit(data, ncomp = 2)




