library(denpro)


### Name: prunemodes
### Title: Prunes modes away from a level set tree or a shape tree
### Aliases: prunemodes
### Keywords: hplot

### ** Examples

dendat<-sim.data(n=100,type="cross")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))
st<-leafsfirst(pcf,propor=0.01)   

td<-treedisc(st,pcf,ngrid=60)
plotbary(td)

td2<-prunemodes(td,modenum=4)
plotbary(td2)





