library(plsRglm)


### Name: dicho
### Title: Dichotomization
### Aliases: dicho
### Keywords: utilities

### ** Examples

dimX <- 6
Astar <- 4
(dataAstar4 <- t(replicate(10,simul_data_YX(dimX,Astar))))

dicho(dataAstar4)

rm(list=c("dimX","Astar"))



