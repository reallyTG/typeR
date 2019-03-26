library(lmSupport)


### Name: figPoints
### Title: Wrapper for standarized use of points()
### Aliases: figPoints
### Keywords: graphic

### ** Examples

X = rep(2:9,4)+jitter(rep(0,32))
Y = X + rnorm(length(X),0,5)
m = lm(Y ~ X)
dNew = data.frame(X=seq(2,9,by=.01))
p = modelPredictions(m,dNew)
figNewDevice()   #default is for windows(), can use quartz, tiff, or pdf as Type
figPlotRegion(x=c(0,10),y=c(0,10))
figConfidenceBand(p$X,p$Predicted,p$CILo,p$CIHi)
figPoints(X,Y)
figLines(p$X,p$Predicted)
figAxis(side=1,lab.text='X-axis 1', scale.at=seq(from=0,to=10,by=2))
figAxis(side=2,lab.text='Startle Response', scale.at=seq(from=0,to=10,by=2))



