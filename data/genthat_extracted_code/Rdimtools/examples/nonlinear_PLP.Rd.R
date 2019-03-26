library(Rdimtools)


### Name: do.plp
### Title: Piecewise Laplacian-based Projection (PLP)
### Aliases: do.plp

### ** Examples

## Not run: 
##D ## generate default dataset
##D X <- aux.gensamples()
##D 
##D ## run 5 times under the same setting
##D par(mfrow=c(1,5))
##D for (i in 1:5){
##D     out = do.plp(X,ndim=2,type=c("proportion",0.2))
##D     pm  = paste("iteration ",i,sep="")
##D     plot(out$Y[,1],out$Y[,2],main=pm)
##D }
## End(Not run)




