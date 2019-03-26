library(TopKLists)


### Name: compute.stream
### Title: Calculates point of degeneration j0 into noise of the Idata,
###   applying moderate deviation-based inference
### Aliases: compute.stream

### ** Examples

set.seed(465)
myhead <- rbinom(20, 1, 0.8)
mytail <- rbinom(20, 1, 0.5)
mydata <- c(myhead, mytail)
compute.stream(mydata, v=10)	



