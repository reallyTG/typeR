library(CateSelection)


### Name: MDR.sing.mod
### Title: Single Model with and without MDR interactions
### Aliases: MDR.sing.mod
### Keywords: MDR.sing.mod

### ** Examples

data(data2)
y <- data2[,1]
x <- data2[,-1]
res <- MDR.sing.mod(x,y,order=3)
res



