library(cbsem)


### Name: gscmcovrr
### Title: 'gscmcovrr' determines the covariance matrix of a GSC model
###   belonging to scenario rr.
### Aliases: gscmcovrr

### ** Examples

Sxixi <- matrix(c(1.0,  0.01,  0.01, 1),2,2)   
B <- matrix(c( 0,0,0, 0,0,0, 0.7,0.4,0),3,3,byrow=TRUE) 
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)                     
lambdax <- c(0.83,0.87,0.87,0.91,0.88,0.82)
lambday <- c(0.89,0.90,0.80)   
out <- gscmcovrr(B,indicatorx,indicatory,lambdax,lambday,Sxixi,R2=NULL)      




