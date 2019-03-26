library(CateSelection)


### Name: MDR.stage.forward
### Title: MDR based forward selection method
### Aliases: MDR.stage.forward
### Keywords: MDR.stage.forward

### ** Examples

data(data1)
y <- data1[,1]
x <- data1[,-1]
res <- MDR.stage.forward(x,y,order=2)
res



