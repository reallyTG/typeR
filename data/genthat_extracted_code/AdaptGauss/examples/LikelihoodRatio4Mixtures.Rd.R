library(AdaptGauss)


### Name: LikelihoodRatio4Mixtures
### Title: Likelihood Ratio for Gaussian Mixtures
### Aliases: LikelihoodRatio4Mixtures

### ** Examples


  
  data2=c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
  ## Not run: 
##D Vals=AdaptGauss(data2,c(-1,0,2),c(2,1,1),c(0.25,0.25,0.5),0.3,-6,6)
##D   NullMixture=cbind(Vals$Means,Vals$SDs,Vals$Weights)
##D   
## End(Not run)
  ## Not run: 
##D Vals2=AdaptGauss(data2,c(-1,0,2,3),c(2,1,1,1),c(0.25,0.25,0.25,0.25),0.3,-6,6)
##D   OneMixture=cbind(Vals2$Means,Vals2$SDs,Vals2$Weights)
##D   
## End(Not run)
  ## Not run: 
##D   res=LikelihoodRatio4Mixtures(Data,NullMixture,OneMixture,T)
##D   
## End(Not run)
 


