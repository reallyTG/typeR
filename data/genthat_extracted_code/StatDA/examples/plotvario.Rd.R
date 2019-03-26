library(StatDA)


### Name: plotvario
### Title: Plot Empirical Variogram
### Aliases: plotvario
### Keywords: multivariate dplot

### ** Examples

data(chorizon)
X=chorizon[,"XCOO"]/1000
Y=chorizon[,"YCOO"]/1000
el=chorizon[,"As"]
vario.b <- variog(coords=cbind(X,Y), data=el, lambda=0, max.dist=300)
plotvario(vario.b,xlab="Distance [km]",ylab="Semivariogram",
cex.lab=1.2,max.dist=300,pch=1,cex=1)



