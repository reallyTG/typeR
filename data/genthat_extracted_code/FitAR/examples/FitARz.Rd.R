library(FitAR)


### Name: FitARz
### Title: Subset ARz Model Fitting
### Aliases: FitARz
### Keywords: ts

### ** Examples

#First Example: Fit exact MLE to AR(4) 
set.seed(3323)
phi<-c(2.7607,-3.8106,2.6535,-0.9238)
z<-SimulateGaussianAR(phi,1000)
ans<-FitARz(z,4,MeanMLEQ=TRUE)
ans
coef(ans)

## Not run: 
##D #save time building package
##D #Second Example: compare with sample mean result
##D ans<-FitARz(z,4)
##D coef(ans)
##D 
##D #Third Example: Fit subset ARz 
##D z<-log(lynx)
##D FitARz(z, c(1,2,4,7,10,11))
##D #now obain exact MLE for Mean as well
##D FitARz(z, c(1,2,4,7,10,11), MeanMLE=TRUE)
##D 
##D #Fourth Example: Fit subset ARz
##D somePACF<-c(0.5,0,0,0,-0.9)
##D someAR<-PacfToAR(somePACF)
##D z<-SimulateGaussianAR(someAR,1000)
##D ans=FitARz(z, c(1,5),MeanMLEQ=TRUE)
##D coef(ans)
##D GetFitARz(z,c(1,5))#assuming a known zero mean
## End(Not run)



