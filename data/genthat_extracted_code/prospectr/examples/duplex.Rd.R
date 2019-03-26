library(prospectr)


### Name: duplex
### Title: DUPLEX algorithm for calibration sampling
### Aliases: duplex

### ** Examples

data(NIRsoil)
sel <- duplex(NIRsoil$spc,k=30,metric='mahal',pc=.99)
plot(sel$pc[,1:2],xlab='PC1',ylab='PC2')
points(sel$pc[sel$model,1:2],pch=19,col=2)  # points selected for calibration
points(sel$pc[sel$test,1:2],pch=18,col=3) # points selected for validation
# Test on artificial data
X <- expand.grid(1:20,1:20) + rnorm(1e5,0,.1)
plot(X[,1],X[,2],xlab='VAR1',ylab='VAR2')
sel <- duplex(X,k=25,metric='mahal')
points(X[sel$model,],pch=19,col=2) # points selected for calibration
points(X[sel$test,],pch=15,col=3) # points selected for validation



