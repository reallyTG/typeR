library(MCMCpack)


### Name: plot.qrssvs
### Title: Plot output from quantile regression stochastic search variable
###   selection (QR-SSVS).
### Aliases: plot.qrssvs
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1)
##D epsilon<-rnorm(100)
##D set.seed(2)
##D x<-matrix(rnorm(1000),100,10)
##D y<-x[,1]+x[,10]+epsilon
##D qrssvs<-SSVSquantreg(y~x)
##D plot(qrssvs$gamma)
##D ## Modify the graph by increasing the fontsize on the axes
##D qrssvsplot<-plot(qrssvs$gamma)
##D update(qrssvsplot, scales=list(cex=3))
## End(Not run)




