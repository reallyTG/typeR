library(plsRglm)


### Name: simul_data_YX
### Title: Data generating function for multivariate plsR models
### Aliases: simul_data_YX
### Keywords: datagen utilities

### ** Examples

simul_data_YX(20,6)                          

## No test: 
if(require(plsdepot)){
dimX <- 6
Astar <- 2
(dataAstar2 <- t(replicate(50,simul_data_YX(dimX,Astar))))
library(plsdepot)
resAstar2 <- plsreg2(dataAstar2[,4:9],dataAstar2[,1:3],comps=5)
resAstar2$Q2
resAstar2$Q2[,4]>0.0975

dimX <- 6
Astar <- 3
(dataAstar3 <- t(replicate(50,simul_data_YX(dimX,Astar))))
library(plsdepot)
resAstar3 <- plsreg2(dataAstar3[,4:9],dataAstar3[,1:3],comps=5)
resAstar3$Q2
resAstar3$Q2[,4]>0.0975

dimX <- 6
Astar <- 4
(dataAstar4 <- t(replicate(50,simul_data_YX(dimX,Astar))))
library(plsdepot)
resAstar4 <- plsreg2(dataAstar4[,5:10],dataAstar4[,1:4],comps=5)
resAstar4$Q2
resAstar4$Q2[,5]>0.0975

rm(list=c("dimX","Astar"))
}
## End(No test)



