library(denpro)


### Name: draw.levset
### Title: Plots a level set of a 2D function
### Aliases: draw.levset
### Keywords: hplot

### ** Examples

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))

draw.levset(pcf,lev=1.331979e-02)

draw.levset(pcf,propor=0.4)




