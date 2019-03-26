library(calibrate)


### Name: dlines
### Title: Connect two sets of points by lines
### Aliases: dlines
### Keywords: aplot

### ** Examples

X <- matrix(runif(20),ncol=2)
Y <- matrix(runif(20),ncol=2)
plot(rbind(X,Y))
text(X[,1],X[,2],paste("X",1:10,sep=""))
text(Y[,1],Y[,2],paste("Y",1:10,sep=""))
dlines(X,Y)



