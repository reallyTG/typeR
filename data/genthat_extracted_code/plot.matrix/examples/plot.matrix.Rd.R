library(plot.matrix)


### Name: plot.matrix
### Title: plot.matrix
### Aliases: plot.matrix plot

### ** Examples

par(mar=c(5.1, 4.1, 4.1, 4.1))
# numeric matrix
x <- matrix(runif(50), nrow=10)
plot(x)
plot(x, key=NULL)
plot(x, key=list(cex.axis=0.5, tick=FALSE))
plot(x, digits=3)
plot(x, breaks=c(0,1), digits=3, cex=0.6)
# logical matrix
m <- matrix(runif(50)<0.5, nrow=10)
plot(m)
plot(m, key=NULL, digits=1)
# character matrix
s <- matrix(sample(letters[1:10], 50, replace=TRUE), nrow=10)
plot(s)
plot(s, digits=10)
plot(s, digits=10, col=heat.colors(5), breaks=letters[1:5])




