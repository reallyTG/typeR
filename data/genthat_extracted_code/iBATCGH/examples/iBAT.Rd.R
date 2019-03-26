library(iBATCGH)


### Name: iBAT
### Title: Main - Mixture selection prior
### Aliases: iBAT
### Keywords: Main

### ** Examples

## Not run: 
##D data(NCI_60)
##D 
##D Y <- NCI_60$Affy
##D X <- NCI_60$aCGH
##D distance <- NCI_60$distance
##D disfix <- 146274826
##D xi <- InitXi(X)
##D tran <- Tran(xi)
##D mu <- InitMu()
##D d=0.2587288
##D 
##D Y <- Center(Y)
##D 
##D res <- iBAT(Y=Y,X=X,distance=distance,disfix=disfix,xi=xi,tran=tran,mu=mu,d=d)
##D 
##D summRes <- Inference(res,G=dim(Y)[[2]],M=dim(X)[[2]],niter=niter,burnin=bi,threshold=0.5)
## End(Not run)



