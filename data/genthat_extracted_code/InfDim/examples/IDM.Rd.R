library(InfDim)


### Name: IDM
### Title: Infinite-dimensional model (IDM)
### Aliases: IDM

### ** Examples


#This example utilizes data given in Kirkpatrick et al. (1990). 
myage=c(2,3,4)
myP=matrix(c(436.0,522.3,424.2,522.3,808.0,664.7,424.2,664.7,558.0),nrow=3,ncol=3,byrow=TRUE)

out=IDM(P=myP,age=myage)

#Growth patterns (i.e. trajectories) 
out$Trajectories

#Proportions of variation accounted for by each growth trajectory
out$Percent.trajectory




