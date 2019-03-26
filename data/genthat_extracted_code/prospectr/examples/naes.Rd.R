library(prospectr)


### Name: naes
### Title: k-means sampling
### Aliases: naes

### ** Examples

data(NIRsoil)
sel <- naes(NIRsoil$spc,k=5,p=.99,method=0)
plot(sel$pc[,1:2],col=sel$cluster+2) # clusters
# points selected for calibration with method = 0
points(sel$pc[sel$model,1:2],col=2,pch=19,cex=1)
sel2 <- naes(NIRsoil$spc,k=sel$centers,p=.99,method=1) # pre-defined centers can also be provided
# points selected for calibration with method = 1
points(sel$pc[sel2$model,1:2],col=1,pch=15,cex=1)



