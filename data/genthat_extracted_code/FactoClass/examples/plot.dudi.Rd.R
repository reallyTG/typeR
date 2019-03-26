library(FactoClass)


### Name: plot.dudi
### Title: Factorial Planes from Objects of Class dudi
### Aliases: plot.dudi sutil.grid
### Keywords: multivariate hplot

### ** Examples

data(Bogota)
ca <- dudi.coa(Bogota[,2:7],scannf=FALSE,nf=4)
# with ggplot2 and ggrepel
plot(ca,gg=TRUE)
dev.new()
# ade4 style
plot.dudi(ca,ex=3,ey=4,ucal=0.2,all.point=FALSE,infaxes="in")



