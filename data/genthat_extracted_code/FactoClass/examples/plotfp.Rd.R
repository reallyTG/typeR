library(FactoClass)


### Name: plotfp
### Title: Factorial Planes from Coordinates
### Aliases: plotfp
### Keywords: multivariate hplot

### ** Examples

data(Bogota)
ca <- dudi.coa(Bogota[,2:7],scannf=FALSE,nf=2)
# ade4 style
plotfp(ca$li,eig=ca$eig,main="First Factorial Plane",infaxes="in")
# with ggplot2 and ggrepel
plotfp(ca$li,eig=ca$eig,main="First Factorial Plane",gg=TRUE)



