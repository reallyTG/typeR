library(hextri)


### Name: hexclass
### Title: Hexagonal binning with classes
### Aliases: hextri hextri.default hextri.formula
### Keywords: hplot

### ** Examples

xx<-rnorm(1000)
yy<-rnorm(1000)
cc<-cut(xx*yy,c(-Inf,-.4,0,.4,Inf))

plot(xx,yy,col=(1:4)[cc])
hextri(xx,yy,cc,1:4,nbins=20,border=TRUE,style="size")

##formula method
data(NHANES, package="hexbin")
hextri(Weight~Age, class=Smoke, col=c("red","orange","green","grey40"),
   data=NHANES, style="size",nbins=20, main="Smoking")
legend("topright",fill=c("red","orange","green","grey40"),
   legend=c("Current","Past","Never","unknown"),bty="n")


## using the return value of hextri
rval<-hextri(xx,yy,cc,1:4,nbins=20,border=TRUE,style="alpha")
plot(y~x,data=rval,type="n")
with(rval, polygon(x,y,col=col,border=NA))

## diffusion
xx<-runif(10000)
yy<-runif(10000)
cc<-rep(1:3,c(4750,4750,500))
hextri(xx,yy,cc,2:4,border=TRUE,diffuse=FALSE,style="size")
hextri(xx,yy,cc,2:4,border=TRUE,diffuse=TRUE,sorted=TRUE, style="size")

hextri(xx,yy,cc,2:4,border=TRUE,diffuse=TRUE,style="size",weights=cc)




