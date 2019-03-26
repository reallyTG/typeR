library(interp)


### Name: outer.convhull
### Title: Version of outer which operates only in a convex hull
### Aliases: outer.convhull
### Keywords: spatial

### ** Examples

x<-runif(20)
y<-runif(20)
z<-runif(20)
z.lm<-lm(z~x+y)
f.pred<-function(x,y)
  {predict(z.lm,data.frame(x=as.vector(x),y=as.vector(y)))}
xg<-seq(0,1,0.05)
yg<-seq(0,1,0.05)
image(xg,yg,outer.convhull(xg,yg,x,y,f.pred))
points(x,y)



