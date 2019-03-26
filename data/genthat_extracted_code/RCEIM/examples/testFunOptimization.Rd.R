library(RCEIM)


### Name: testFunOptimization
### Title: 1D test problem for RCEIM
### Aliases: testFunOptimization
### Keywords: misc design

### ** Examples

# Create a graphical representation of the problem with a line plot
dev.new()
xx <- seq(-10,10,by=0.01) 
plot(xx, testFunOptimization(xx), type="l", xlab="x", ylab="Value")
rm(list=c('xx'))



