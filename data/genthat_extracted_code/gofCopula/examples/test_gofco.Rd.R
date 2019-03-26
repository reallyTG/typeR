library(gofCopula)


### Name: gofco
### Title: Interface with copula class
### Aliases: gofco

### ** Examples

data(IndexReturns)
copObject = normalCopula()

gofco(copObject, x = IndexReturns[c(1:100),c(1:2)], testset = c("gofPIOSRn", "gofKernel"), M = 20)



