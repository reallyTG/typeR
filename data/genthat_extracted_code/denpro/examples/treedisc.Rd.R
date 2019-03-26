library(denpro)


### Name: treedisc
### Title: Prunes a level set tree or a tail tree
### Aliases: treedisc
### Keywords: multivariate

### ** Examples

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
lst<-leafsfirst(pcf)          # level set tree
td<-treedisc(lst,pcf,ngrid=30)

plotvolu(td)

r<-c(0.01,0.03,0.04)
td<-treedisc(lst,pcf,r=r)

plotvolu(td)




