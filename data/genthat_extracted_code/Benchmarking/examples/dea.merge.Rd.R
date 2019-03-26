library(Benchmarking)


### Name: dea.merge
### Title: Estimate potential merger gains and their decompositions
### Aliases: dea.merge
### Keywords: models efficiency merger

### ** Examples

x <- matrix(c(100,200,300,500),ncol=1,dimnames=list(LETTERS[1:4],"x"))
y <- matrix(c(75,100,300,400),ncol=1,dimnames=list(LETTERS[1:4], "y"))

dea.plot.frontier(x,y,RTS="vrs",txt=LETTERS[1:length(x)],
	xlim=c(0,1000),ylim=c(0,1000) )
dea.plot.frontier(x,y,RTS="drs", add=TRUE, lty="dashed", lwd=2)
dea.plot.frontier(x,y,RTS="crs", add=TRUE, lty="dotted")

dea(x,y,RTS="crs")
M <- make.merge(list(c(1,2), c(3,4)), X=x)
xmer <- M %*% x
ymer <- M %*% y
points(xmer,ymer,pch=8)
text(xmer,ymer,labels=c("A+B","C+D"),pos=4)
dea.merge(x,y,M, RTS="vrs")
dea.merge(x,y,M, RTS="crs")



