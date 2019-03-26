library(pamctdp)


### Name: plot.parwwm
### Title: Superimposed Representacion on Factorial Planes from Objects of
###   Class parwwm
### Aliases: plot.parwwm
### Keywords: multivariate hplot

### ** Examples

data(ardeche)
ca <- dudi.coa(ardeche$tab,scannf=FALSE,nf=4)
# FactoMineR style
plot.dudi(ca,ucal=40,all.point=FALSE,main="SCA of Ardeche, First Factorial Plane")
dev.new()
# ade4 style
plot.dudi(ca,xy=c(3,4),ucal=20,all.point=FALSE,infaxes="in",main="SCA of
Ardeche, Plane 3-4")



