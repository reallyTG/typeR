library(denpro)


### Name: plottree
### Title: Makes a tree plot of a level set tree, of a shape tree, or of a
###   tail tree
### Aliases: plottree
### Keywords: multivariate hplot

### ** Examples

dendat<-sim.data(n=50,type="mulmod")

pcf<-pcf.kern(dendat,h=1,N=c(32,32))
lst<-leafsfirst(pcf)
td<-treedisc(lst,pcf,ngrid=30)
plottree(td)




