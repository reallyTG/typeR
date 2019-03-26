library(geomorph)


### Name: plotRefToTarget
### Title: Plot shape differences between a reference and target specimen
### Aliases: plotRefToTarget
### Keywords: visualization

### ** Examples

# Two dimensional data
data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment
ref<-mshape(Y.gpa$coords)
plotRefToTarget(ref,Y.gpa$coords[,,39])
plotRefToTarget(ref,Y.gpa$coords[,,39],mag=2,outline=plethodon$outline)   #magnify by 2X
plotRefToTarget(ref,Y.gpa$coords[,,39],method="vector",mag=3)
plotRefToTarget(ref,Y.gpa$coords[,,39],method="points",outline=plethodon$outline)
plotRefToTarget(ref,Y.gpa$coords[,,39],gridPars=gridPar(pt.bg = "green", pt.size = 1),
method="vector",mag=3)

# Three dimensional data
# data(scallops)
# Y.gpa<-gpagen(A=scallops$coorddata, curves=scallops$curvslide, surfaces=scallops$surfslide)
# ref<-mshape(Y.gpa$coords)
# plotRefToTarget(ref,Y.gpa$coords[,,1],method="points")
# scallinks <- matrix(c(1,rep(2:16, each=2),1), nrow=16, byrow=TRUE)
# plotRefToTarget(ref,Y.gpa$coords[,,1],gridPars=gridPar(tar.pt.bg = "blue", tar.link.col="blue",
# tar.link.lwd=2), method="points", links = scallinks)




