library(cbsem)


### Name: gscmcovfr
### Title: 'gscmcovfr' determines the covariance matrix of a GSC model
###   belonging to scenario fr. The covariance matrices of the errors are
###   supposed to be diagonal.
### Aliases: gscmcovfr

### ** Examples

Sxixi <- matrix(c(1.0,  0.01,  0.01, 1),2,2)   
B <- matrix(c( 0,0,0, 0,0,0, 0.7,0.4,0),3,3,byrow=TRUE) 
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)  
lambday <- c(0.89,0.90,0.80)    
wx <- c(0.46, 0.31, 0.32, 0.34, 0.40, 0.37) 
out <- gscmcovfr(B,indicatorx,indicatory,lambday,wx,Sxixi,R2=NULL)      




