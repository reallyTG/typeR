library(segmented)


### Name: broken.line
### Title: Fitted values for segmented relationships
### Aliases: broken.line
### Keywords: regression nonlinear

### ** Examples

set.seed(1234)
z<-runif(100)
y<-rpois(100,exp(2+1.8*pmax(z-.6,0)))
o<-glm(y~z,family=poisson)
o.seg<-segmented(o,seg.Z=~z,psi=.5)
## Not run: plot(z,y)
## Not run: points(z,broken.line(o.seg,link=FALSE)$fit,col=2) #just to illustrate, use plot.segmented
    


