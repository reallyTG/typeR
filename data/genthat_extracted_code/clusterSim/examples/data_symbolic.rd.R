library(clusterSim)


### Name: data_symbolic
### Title: Symbolic interval data
### Aliases: data_symbolic
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_symbolic)
r<- HINoV.Symbolic(data_symbolic, u=5)
print(r$stopri)
plot(r$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])



