library(FitAR)


### Name: GetARMeanMLE
### Title: Exact MLE for Mean in AR(p)
### Aliases: GetARMeanMLE
### Keywords: ts

### ** Examples

#Simulate a time series with mean zero and compute the exact
#mle for mean and compare with sample average.
## Not run: 
##D  #save time building package!
##D  set.seed(3323)
##D  phi<-c(2.7607,-3.8106,2.6535,-0.9238)
##D  z<-SimulateGaussianAR(phi,1000)
##D  ans1<-mean(z)
##D  ans2<-GetARMeanMLE(z,phi)
##D # define a direct MLE function
##D "DirectGetMeanMLE" <-
##D function(z, phi){
##D     GInv<-solve(toeplitz(TacvfAR(phi, length(z)-1)))
##D     g1<-colSums(GInv)
##D     sum(g1*z)/sum(g1)
##D }
##D ans3<-DirectGetMeanMLE(z,phi)
##D ans<-c(ans1,ans2,ans3)
##D names(ans)<-c("mean", "GetARMeanMLE","DirectGetMeanMLE")
##D ans
## End(Not run)



