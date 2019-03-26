library(ider)


### Name: ider-package
### Title: Algorithms for estimating intrinsic dimensions.
### Aliases: ider-package ider

### ** Examples

## Not run: 
##D  ## global intrinsic dimension estimate
##D  x <- gendata(DataName='SwissRoll',n=300)
##D  
##D  x <- gendata(DataName='SwissRoll',n=300,p=3,q=2)
##D  estcorint <- corint(x=x,k1=5,k2=10)
##D  print(estcorint)
##D  
##D  estmle <- lbmle(x=x,k1=3,k2=5)  ## estimation by mle
##D  print(estmle) 
##D  
##D  estnii <- nni(x=x) ## estimation by nearest neighbor information
##D  print(estnni)
##D  
##D  estconvU <- convU(x=x)  ## estimation by convergence property of U-stats
##D  print(estconvU)
##D  
##D estpackG <- pack(x=x,greedy=TRUE)  ## estimation by the packing number method with greedy algorithm
##D print(estpackG)
##D estpackC <- pack(x=x,greedy=FALSE) ## estimation by the packing number method by clutering
##D print(estpackC)
##D 
##D  ## local intrinsic dimension estimate
##D  tmp <- gendata(DataName='ldbl',n=300)
##D x <- tmp$x
##D estmada <- mada(x=x,local=TRUE)
##D head(estmada)  ## estimated local intrinsic dimensions by mada
##D head(tmp$tDim) ## true local intrinsic dimensions
##D estside <- side(x=x,local=TRUE)
##D head(estside) ## estimated local intrinsic dimensions by side
##D 
## End(Not run)



