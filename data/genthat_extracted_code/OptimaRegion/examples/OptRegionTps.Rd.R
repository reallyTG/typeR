library(OptimaRegion)


### Name: OptRegionTps
### Title: Computes Confidence Regions of Optima of Thin Plate Spline
###   Models
### Aliases: OptRegionTps

### ** Examples

## Not run: 
##D ## Example 1: randomly generated 2-variable response surface data
##D 
##D X<-cbind(runif(100,-2,2),runif(100,-2,2))
##D 
##D y<-as.matrix(72-11.78*X[,1]+0.74*X[,2]-7.25*X[,1]^2-7.55*X[,2]^2-4.85*X[,1]*X[,2]+
##D rnorm(100,0,8))
##D 
##D ## Find a 95 percent confidence region for the maximum of a Thin Plate Spline
##D model fitted to these data
##D 
##D out<-OptRegionTps(X=X,y=y,nosim=200,LB=c(-2,-2),UB=c(2,2), xlab="X1",ylab="X2")
##D 
##D ## Example 2: a mixture-amount experiment in two components (Drug dataset) with
##D non-normal data. Note triangular experimental region. Resulting 95p confidence
##D region of the maxima of a TPS model has area > 0. Contrast with region for
##D quadratic polynomial model. Note: 500 bootstrap iterations may take a few minutes.
##D 
##D out<-OptRegionTps(X=Drug[,1:2],y=Drug[,3],nosim=500,lambda=0.05,LB=c(0,0),UB=
##D  c(0.08,11), xlab="Component 1 (mg.)",ylab="Component 2 (mg.)",triangularRegion
##D  = TRUE,vertex1 = c(0.02,11),vertex2 = c(0.08,1.8),outputPDFFile=
##D  "Mixture_plot.pdf")
## End(Not run)



