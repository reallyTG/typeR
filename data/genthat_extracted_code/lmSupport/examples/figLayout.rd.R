library(lmSupport)


### Name: figLayout
### Title: Wrapper for standarized use of layout()
### Aliases: figLayout
### Keywords: graphic

### ** Examples

X = rep(2:9,4)+jitter(rep(0,32))
Y = X + rnorm(length(X),0,5)
m = lm(Y ~ X)
dNew = data.frame(X=seq(2,9,by=.01))
p = modelPredictions(m,dNew)

figNewDevice()  
figLayout(2,1)
figPlotRegion(x=c(0,10),y=c(0,10))
figConfidenceBand(p$X,p$Predicted,p$CILo,p$CIHi)
figLines(p$X,p$Predicted)
figAxis(side=1,lab.text='X-axis 1', scale.at=seq(from=0,to=10,by=2))
figAxis(side=2,lab.text='Startle Response', scale.at=seq(from=0,to=10,by=2))

figPlotRegion(x=c(0,10),y=c(0,10))
figPoints(X,Y)
figAxis(side=1,lab.text='X-axis 1', scale.at=seq(from=0,to=10,by=2))
figAxis(side=2,lab.text='Startle Response', scale.at=seq(from=0,to=10,by=2))



