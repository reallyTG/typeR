library(iBATCGH)


### Name: iBATProbit
### Title: Main - Probit selection prior
### Aliases: iBATProbit
### Keywords: Main

### ** Examples

## Not run: 
##D data(TCGA_lung)
##D 
##D Y <- TCGA_lung$Affy
##D X <- TCGA_lung$aCGH
##D distance <- TCGA_lung$distance
##D disfix <- 199446827
##D xi <- InitXi(X)
##D tran <- Tran(xi)
##D mu <- InitMu()
##D d=0.2587288
##D 
##D Y <- Center(Y)
##D 
##D res <- iBATProbit(Y=Y,X=X,distance=distance,disfix=disfix,xi=xi,tran=tran,mu=mu,d=d)
##D 
##D summRes <- Inference(res,G=dim(Y)[[2]],M=dim(X)[[2]],niter=niter,burnin=bi,threshold=0.5)
## End(Not run)



