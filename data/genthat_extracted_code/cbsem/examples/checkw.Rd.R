library(cbsem)


### Name: checkw
### Title: Checking composite based SE models if there are weights in
###   accordance with the loadings and the covariance matrix of the
###   composites
### Aliases: checkw

### ** Examples

   
B <- matrix(c(0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,
              0,1,1,0,0,0,0,1,1,1,0,0,1,0,0,0,1,0),6,6,byrow=TRUE)
indicatorx <- c(1,1,1,1,1)
indicatory <- c(1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5) 
lambdax <- c(0.73, 0.60, 0.60, 0.77, 0.74) 
lambday <- c(0.79, 0.68, 0.60, 0.90, 0.94, 0.80, 0.65, 0.78, 0.78, 0.74, 
                     0.77, 0.78, 0.80, 0.84, 0.85, 0.86, 0.23, 0.87) 
Sxixi <- matrix(1,1,1)
out <- checkw(B,indicatorx,indicatory,lambdax=TRUE,lambday=TRUE,wx=FALSE,wy=FALSE, Sxixi,R2=NULL)




