library(cbsem)


### Name: gscmcov
### Title: Determination of the covariance matrix of a GSC model belonging
###   to scenario 1, scenario 2, scenario 3
### Aliases: gscmcov

### ** Examples

Sxixi <- matrix(c(1.0,  0.01,  0.01, 1),2,2)   
B <- matrix(c( 0,0,0, 0,0,0, 0.7,0.4,0),3,3,byrow=TRUE) 
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)                     
lambdax <- c(0.83,0.87,0.87,0.91,0.88,0.82)
lambday <- c(0.89,0.90,0.80)  
wx <- c(0.46, 0.31, 0.32, 0.34, 0.40, 0.37)
wy <- c(0.41, 0.39, 0.37)    
out <- gscmcov(B,indicatorx,indicatory,lambdax,lambday,wx=NULL,wy=NULL,Sxixi,R2=NULL)        




