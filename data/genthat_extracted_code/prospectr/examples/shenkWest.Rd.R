library(prospectr)


### Name: shenkWest
### Title: SELECT algorithm for calibration sampling
### Aliases: shenkWest

### ** Examples

data(NIRsoil)
sel <- shenkWest(NIRsoil$spc,pc=.99,d.min=.3,rm.outlier=FALSE)
plot(sel$pc[,1:2],xlab='PC1',ylab='PC2')
points(sel$pc[sel$model,1:2],pch=19,col=2)  # points selected for calibration
# without outliers
sel <- shenkWest(NIRsoil$spc,pc=.99,d.min=.3,rm.outlier=TRUE)
plot(sel$pc[,1:2],xlab='PC1',ylab='PC2')
points(sel$pc[sel$model,1:2],pch=15,col=3)  # points selected for calibration



