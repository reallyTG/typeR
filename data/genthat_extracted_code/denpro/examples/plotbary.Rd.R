library(denpro)


### Name: plotbary
### Title: Makes a barycenter plot of a level set tree, a location plot of
###   a shape tree, or a tail tree plot of a tail tree
### Aliases: plotbary
### Keywords: multivariate hplot

### ** Examples

# level set tree

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
lst<-leafsfirst(pcf)             
td<-treedisc(lst,pcf,ngrid=30)

plotbary(td)

plotbary(td,coordi=2,ptext=0.002,symbo="L",modlabret=TRUE)

# shape tree

dendat<-sim.data(n=100,type="cross")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
st<-leafsfirst(pcf,propor=0.01)   
td<-treedisc(st,pcf,ngrid=60)

plotbary(td)

# tail tree

tt<-leafsfirst(dendat=dendat,rho=0.65)  
plotbary(tt)




