library(prospectr)


### Name: kenStone
### Title: Kennard-Stone algorithm for calibration sampling
### Aliases: kenStone

### ** Examples

data(NIRsoil)
sel <- kenStone(NIRsoil$spc,k=30,pc=.99)
plot(sel$pc[,1:2],xlab='PC1',ylab='PC2')
points(sel$pc[sel$model,1:2],pch=19,col=2)  # points selected for calibration
# Test on artificial data
X <- expand.grid(1:20,1:20) + rnorm(1e5,0,.1)
plot(X,xlab='VAR1',ylab='VAR2')
sel <- kenStone(X,k=25,metric='euclid')
points(X[sel$model,],pch=19,col=2)



