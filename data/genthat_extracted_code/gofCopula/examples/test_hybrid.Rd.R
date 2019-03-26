library(gofCopula)


### Name: gofHybrid
### Title: Hybrid gof test
### Aliases: gofHybrid

### ** Examples

data(IndexReturns)

gofHybrid("normal", IndexReturns[c(1:100),c(1:2)], 
testset = c("gofRosenblattSnB", "gofRosenblattSnC"), M = 10)



