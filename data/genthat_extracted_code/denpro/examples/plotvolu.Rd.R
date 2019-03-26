library(denpro)


### Name: plotvolu
### Title: Makes a volume plot of a level set tree, a shape plot of a shape
###   tree, or a tail frequency plot of a tail tree
### Aliases: plotvolu
### Keywords: multivariate hplot

### ** Examples

# level set tree

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
lst<-leafsfirst(pcf)             
td<-treedisc(lst,pcf,ngrid=30)

plotvolu(td)

plotvolu(td,ptext=0.002,modelabel=TRUE,symbo="L",colo=TRUE)

# shape tree

dendat<-sim.data(n=100,type="cross")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
st<-leafsfirst(pcf,propor=0.01)   
td<-treedisc(st,pcf,ngrid=60)

plotvolu(td)

plotvolu(td,proba=TRUE)

# tail tree

tt<-leafsfirst(dendat=dendat,rho=0.65)  
plotvolu(tt)




