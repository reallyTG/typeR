library(denpro)


### Name: leafsfirst
### Title: Computes a level set tree, shape tree, or tail tree
### Aliases: leafsfirst
### Keywords: multivariate smooth

### ** Examples

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))

# level set tree

lst<-leafsfirst(pcf)          

td<-treedisc(lst,pcf,ngrid=30)
plotvolu(td)

# shape tree

st<-leafsfirst(pcf,propo=0.1)   # 10% level set  

tdst<-treedisc(st,pcf,ngrid=30)
plotvolu(tdst)

# tail tree

rho<-0.65
tt<-leafsfirst(dendat=dendat,rho=rho)

plotbary(tt)




