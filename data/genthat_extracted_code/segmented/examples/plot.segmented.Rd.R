library(segmented)


### Name: plot.segmented
### Title: Plot method for segmented objects
### Aliases: plot.segmented
### Keywords: regression nonlinear hplot

### ** Examples

set.seed(1234)
z<-runif(100)
y<-rpois(100,exp(2+1.8*pmax(z-.6,0)))
o<-glm(y~z,family=poisson)
o.seg<-segmented(o, ~z) #single segmented covariate and one breakpoint:'psi' can be omitted
par(mfrow=c(2,1))
plot(o.seg, conf.level=0.95, shade=TRUE)
points(o.seg, link=FALSE, col=2)
## new plot
plot(z,y)
## add the fitted lines using different colors and styles..
plot(o.seg,add=TRUE,link=FALSE,lwd=2,col=2:3, lty=c(1,3))
lines(o.seg,col=2,pch=19,bottom=FALSE,lwd=2)
points(o.seg,col=4, link=FALSE)



