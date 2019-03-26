library(Delta)


### Name: GetCovariance
### Title: Calculate Covariance function
### Aliases: GetCovariance
### Keywords: B Covarianze Delta Pi k mx

### ** Examples

GetCovariance(mx = matrix(c(1.5,0.5,0.5,0.5,2.5,0.5,0.5,0.5,3.5),3,3), 
			 Delta = c(0.4,0.5714286,0.666667), 
              Pi = c(0.3333,0.333333,0.33333),B = 4.5)
GetCovariance(mx = matrix(c(60,0,3,2,50,1,3,2,79),3,3), 
			Delta = c( 0.8945724, 0.9522836, 0.8962094), 
              Pi = c( 0.2703707, 0.1939561, 0.5356732), B = 17.94867)



