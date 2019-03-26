library(denpro)


### Name: shape2d
### Title: Returns a 2D volume function or 2D probability content function
### Aliases: shape2d
### Keywords: multivariate

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

type<-"proba"
vd3<-shape2d(st,gnum=gnum,type=type,ngrid=ngrid,norma=TRUE)

plotvolu2d(vd3)




