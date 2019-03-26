library(binGroup)


### Name: sim.mp
### Title: Simulation Function for Group Testing Data with Matrix Pooling
###   Design
### Aliases: sim.mp
### Keywords: datagen

### ** Examples


# 5*6 and 4*5 matrix
set.seed(9128)
sa1a<-sim.mp(par=c(-7,0.1), n.row=c(5,4), n.col=c(6,5),
 sens=0.95, spec=0.95)
sa1<-sa1a$dframe





