library(denpro)


### Name: plotbranchmap
### Title: Plots a branching map
### Aliases: plotbranchmap
### Keywords: multivariate hplot

### ** Examples

dendat<-sim.data(n=200,type="mulmod")

h1<-0.9
h2<-2.2
lkm<-5
hseq<-hgrid(h1,h2,lkm)

N<-c(16,16)
estiseq<-lstseq.kern(dendat,hseq,N,lstree=TRUE)

bm<-branchmap(estiseq)

plotbranchmap(bm)

## The function is currently defined as
function(bm,phi=55,theta=30)
{

persp(x=bm$level,y=bm$h,z=bm$z, 
xlab="level",ylab="h",zlab="excess mass",
ticktype="detailed",
col=bm$col,phi=phi,theta=theta) 

  }



