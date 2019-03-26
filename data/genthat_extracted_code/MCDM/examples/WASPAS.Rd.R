library(MCDM)


### Name: WASPAS
### Title: Implementation of WASPAS Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: WASPAS

### ** Examples


 d <- matrix(c(370,314,480,850,11,7,10,16,2.69,2.37,3.09,3.17,2.75,3.27,3.67,4.10,
 5,35,30,50,1.63,1.72,1.87,1.91,1.47,2.07,1.38,2.22,7.11,5.60,7.82,8.25,88,12.60,94,
 23,410,100,410,65,2.93,2.13,2.87,1.10,1.98,3.21,2.94,4.37),nrow = 4,ncol = 12)
 w <- c(0.0626,0.0508,0.1114,0.0874,0.0625,0.1183,0.0784,0.0984,0.053,0.1417,
 0.0798,0.0557)
 cb <- c('min','min','max','max','max','max','max','max','min','min','max','max')
 lambda <- 0.5
 WASPAS(d,w,cb,lambda)



