library(Rdimtools)


### Name: aux.preprocess
### Title: Preprocessing the data
### Aliases: aux.preprocess

### ** Examples

## Not run: 
##D ## Generate data
##D X = aux.gensamples()
##D 
##D ## 5 types of preprocessing
##D X_center = aux.preprocess(X)
##D X_scale  = aux.preprocess(X,type="scale")
##D X_cscale = aux.preprocess(X,type="cscale")
##D X_decorr = aux.preprocess(X,type="decorrelate")
##D X_whiten = aux.preprocess(X,type="whiten")
##D 
##D ## Check with Covariance matrix
##D par(mfrow=c(2,3))
##D image(cov(X)[,3:1],          zlim=c(-5,5)); title("original covariance")
##D image(cov(X_center$pX)[,3:1],zlim=c(-5,5)); title("opt::center")
##D image(cov(X_scale$pX)[,3:1], zlim=c(-5,5)); title("opt::scale")
##D image(cov(X_cscale$pX)[,3:1],zlim=c(-5,5)); title("opt::cscale")
##D image(cov(X_decorr$pX)[,3:1],zlim=c(-5,5)); title("opt::decorrelate")
##D image(cov(X_whiten$pX)[,3:1],zlim=c(-5,5)); title("opt::whiten")
## End(Not run)




