library(geomorph)


### Name: gridPar
### Title: Set up parameters for grids, points, and links in
###   plotRefToTarget
### Aliases: gridPar
### Keywords: utilities visualization

### ** Examples

data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment
ref<-mshape(Y.gpa$coords)
plotRefToTarget(ref,Y.gpa$coords[,,39]) # default settings

# Altering points and links
GP1 <- gridPar(pt.bg = "red", pt.size = 1, link.col="blue", link.lwd=2, n.col.cell=50)
plotRefToTarget(ref,Y.gpa$coords[,,39], gridPars=GP1, mag=2, 
links=plethodon$links, method="TPS")

# Altering point color
GP2 <- gridPar(pt.bg = "green", pt.size = 1) 
plotRefToTarget(ref,Y.gpa$coords[,,39], gridPars=GP2, mag=3, method="vector")

# Altering ref and target points
GP3 <- gridPar(pt.bg = "blue", pt.size = 1.5, tar.pt.bg = "orange", tar.pt.size = 1) 
plotRefToTarget(ref,Y.gpa$coords[,,39], gridPars=GP3, mag=3, method="points")

# Altering outline color
GP4 <- gridPar(tar.out.col = "red", tar.out.cex = 0.3) 
plotRefToTarget(ref,Y.gpa$coords[,,39], gridPars=GP4, mag=3, 
outline=plethodon$outline, method="TPS")

# Altering text labels
GP5 <- gridPar(txt.pos = 3, txt.col = "red") 
plotRefToTarget(ref,Y.gpa$coords[,,39], gridPars=GP5, mag=3, method="vector", label=TRUE)



