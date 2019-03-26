library(compositions)


### Name: compOKriging
### Title: Compositional Ordinary Kriging
### Aliases: compOKriging
### Keywords: multivariate

### ** Examples

## Not run: 
##D # Load data
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D lrv <- logratioVariogram(comp,X,maxdist=1,nbins=10)
##D plot(lrv)
##D 
##D # Fit a variogram model
##D vgModel <- CompLinModCoReg(~nugget()+sph(0.5)+R1*exp(0.7),comp)
##D fit <- vgmFit2lrv(lrv,vgModel)
##D fit
##D plot(lrv,lrvg=vgram2lrvgram(fit$vg))
##D 
##D # Define A grid
##D x <- (0:30/30)*6
##D y <- (0:30/30)*6
##D Xnew <- cbind(rep(x,length(y)),rep(y,each=length(x)))
##D 
##D # Kriging
##D erg <- compOKriging(comp,X,Xnew,fit$vg,err=FALSE)
##D par(mar=c(0,0,1,0))
##D pairwisePlot(erg$Z,panel=function(a,b,xlab,ylab) {image(x,y,
##D                      structure(log(a/b),dim=c(length(x),length(y))),
##D                      main=paste("log(",xlab,"/",ylab,")",sep=""));points(X,pch=".")})
##D 
##D 
##D # Check interpolation properties 
##D ergR <- compOKriging(comp,X,X,fit$vg,err=FALSE)
##D pairwisePlot(ilr(comp),ilr(ergR$Z))
##D ergR <- compOKriging(comp,X,X+1E-7,fit$vg,err=FALSE)
##D pairwisePlot(ilr(comp),ilr(ergR$Z))
##D ergR <- compOKriging(comp,X,X[rev(1:31),],fit$vg,err=FALSE)
##D pairwisePlot(ilr(comp)[rev(1:31),],ilr(ergR$Z))
## End(Not run)



