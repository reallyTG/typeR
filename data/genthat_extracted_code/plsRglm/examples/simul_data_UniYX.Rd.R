library(plsRglm)


### Name: simul_data_UniYX
### Title: Data generating function for univariate plsR models
### Aliases: simul_data_UniYX
### Keywords: datagen utilities

### ** Examples

simul_data_UniYX(20,6)                          

## No test: 
dimX <- 6
Astar <- 2
simul_data_UniYX(dimX,Astar)
(dataAstar2 <- t(replicate(50,simul_data_UniYX(dimX,Astar))))
cvtable(summary(cv.plsR(dataAstar2[,1],dataAstar2[,2:7],5,NK=100)))

dimX <- 6
Astar <- 3
simul_data_UniYX(dimX,Astar)
(dataAstar3 <- t(replicate(50,simul_data_UniYX(dimX,Astar))))
cvtable(summary(cv.plsR(dataAstar3[,1],dataAstar3[,2:7],5,NK=100)))

dimX <- 6
Astar <- 4
simul_data_UniYX(dimX,Astar)
(dataAstar4 <- t(replicate(50,simul_data_UniYX(dimX,Astar))))
cvtable(summary(cv.plsR(dataAstar4[,1],dataAstar4[,2:7],5,NK=100)))

rm(list=c("dimX","Astar"))
## End(No test)



