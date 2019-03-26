library(HardyWeinberg)


### Name: HWCondProbAB
### Title: Compute probability of a genotypic sample
### Aliases: HWCondProbAB
### Keywords: misc

### ** Examples

x <- c(298,489,213)
names(x) <- c("MM","MN","NN")
n <- sum(x)
nM <- 2*x[1]+x[2]
nMN <- x[2]
p <- HWCondProbAB(n,nM,nMN)



