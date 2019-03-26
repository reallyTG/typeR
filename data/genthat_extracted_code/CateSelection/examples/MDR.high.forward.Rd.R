library(CateSelection)


### Name: MDR.high.forward
### Title: MDR based selection methods for higher-order interacations
### Aliases: MDR.high.forward
### Keywords: MDR.high.forward

### ** Examples

data(data2)
y <- data2[,1]
x <- data2[,-1]
res <- MDR.high.forward(x,y,order=3)
res



