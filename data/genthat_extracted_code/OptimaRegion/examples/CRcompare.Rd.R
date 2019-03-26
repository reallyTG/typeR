library(OptimaRegion)


### Name: CRcompare
### Title: Computes bootstrapped confidence intervals for the distance
###   between two response surface optima
### Aliases: CRcompare

### ** Examples

## Not run: 
##D ## Example: two randomly generated data sets, quadratic polynomial responses.
##D 
##D X1<-cbind(runif(100,-2,2),runif(100,-2,2))
##D 
##D y1<-as.matrix(72-11.78*X1[,1]+0.74*X1[,2]-7.25*X1[,1]^2-7.55*X1[,2]^2-4.85*X1[,1]*X1[,2]+
##D                   rnorm(100,0,8))
##D 
##D X2<-cbind(runif(100,-2,2),runif(100,-2,2))
##D 
##D y2<-as.matrix(72-11.78*X2[,1]+0.74*X2[,2]-7.25*X2[,1]^2-7.55*X2[,2]^2-4.85*X2[,1]*X2[,2]+
##D                   rnorm(100,0,8))
##D 
##D out<-CRcompare(X1=X1,y1=y1,X2=X2,y2=y2,responseType='Quad',nosim1and2=200,
##D alpha=0.05,LB1=c(-2,-2),UB1=c(2,2),LB2=c(-2,-2),UB2=c(2,2))
## End(Not run)



