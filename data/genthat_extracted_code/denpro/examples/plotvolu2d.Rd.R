library(denpro)


### Name: plotvolu2d
### Title: Makes a perspective plot of a 2D volume function or a 2D
###   probability content function
### Aliases: plotvolu2d
### Keywords: hplot

### ** Examples

N<-c(30,30)  
lnum<-20
func<-"gumbel"
marginal<-"normal"
g<-2
ver<-3
support<-c(-ver,ver,-ver,ver)
st<-stseq(N,lnum,func=func,marginal=marginal,g=g,support=support)

gnum<-50 
ngrid=50 
vd<-shape2d(st,gnum=gnum,ngrid=ngrid) 

plotvolu2d(vd)

plotvolu2d(vd,theta=30)




