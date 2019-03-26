library(plsRglm)


### Name: simul_data_complete
### Title: Data generating detailed process for multivariate plsR models
### Aliases: simul_data_complete
### Keywords: datagen utilities

### ** Examples

simul_data_complete(20,6)                          

dimX <- 6
Astar <- 2
simul_data_complete(dimX,Astar)


dimX <- 6
Astar <- 3
simul_data_complete(dimX,Astar)


dimX <- 6
Astar <- 4
simul_data_complete(dimX,Astar)

rm(list=c("dimX","Astar"))



