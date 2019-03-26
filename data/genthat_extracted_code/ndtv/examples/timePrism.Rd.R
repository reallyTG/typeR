library(ndtv)


### Name: timePrism
### Title: Plot a networkDynamic object as sequence of snapshots in a
###   pseudo-3D space-time prism
### Aliases: timePrism

### ** Examples

data("short.stergm.sim")
compute.animation(short.stergm.sim)
timePrism(short.stergm.sim,at=c(1,10,20),
          displaylabels=TRUE,
          label.cex=0.5)
          
data(toy_epi_sim)  
timePrism(toy_epi_sim,
          orientation=c('z','y','x'),
          angle=40,
          spline.v=c(7, 29, 36, 70, 82, 96),  # hilite the infected 
          spline.col='red',
          spline.lwd=2,
          box=FALSE,
          planes=TRUE,
          vertex.col='ndtvcol')



