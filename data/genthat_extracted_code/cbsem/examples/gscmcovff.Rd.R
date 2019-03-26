library(cbsem)


### Name: gscmcovff
### Title: 'gscmcovff' determines the covariance matrix of a GSC model
###   belonging to scenario ff.
### Aliases: gscmcovff

### ** Examples

B <- matrix(c(0,0,0, 0,0,0, 0.7,0.4,0),3,3,byrow=TRUE) 
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)   
Sxixi <- matrix(c(1.0, 0.01, 0.01, 1),2,2)    
wx <- c(0.46, 0.31, 0.32, 0.34, 0.40, 0.37)
wy <- c(0.41, 0.39, 0.37)    
out <- gscmcovff(B,indicatorx,indicatory,wx,wy,Sxixi,R2=NULL)




