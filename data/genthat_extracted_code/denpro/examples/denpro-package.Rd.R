library(denpro)


### Name: denpro-package
### Title: Visualization of Multivariate Functions, Sets, and Data
### Aliases: denpro-package denpro
### Keywords: multivariate

### ** Examples

# level set tree

dendat<-sim.data(n=200,type="mulmod")   # data
pcf<-pcf.kern(dendat,h=1,N=c(32,32))    # kernel estimate

lst<-leafsfirst(pcf)             # level set tree
td<-treedisc(lst,pcf,ngrid=60)   # pruned level set tree

plotvolu(td)                     # volume plot

plotbary(td)                     # barycenter plot 

# shape tree

dendat<-sim.data(n=200,type="cross")    # data
pcf<-pcf.kern(dendat,h=1,N=c(32,32))    # kernel estimate

st<-leafsfirst(pcf,propo=0.01)   # shape tree, 1 per cent level set
tdst<-treedisc(st,pcf,ngrid=60)  # pruned shape tree

plotvolu(tdst)          # radius plot

plotbary(tdst)          # location plot

# tail tree

dendat<-sim.data(n=200,type="cross")    # data

tt<-leafsfirst(dendat=dendat,rho=0.65) # tail tree

plotbary(tt)     # tail tree plot

plotvolu(tt)     # tail frequency plot




