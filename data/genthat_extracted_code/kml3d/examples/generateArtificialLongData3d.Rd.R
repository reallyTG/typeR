library(kml3d)


### Name: generateArtificialLongData3d
### Title: ~ Function: generateArtificialLongData3d (or gald3d) ~
### Aliases: gald3d generateArtificialLongData3d
### Keywords: datagen cluster ts

### ** Examples

#####################
### Default example

ex1 <- generateArtificialLongData3d()
plot3d(ex1,parTraj=parTRAJ(col=rep(2:4,each=50)))


#####################
### 4 lines with unbalanced groups

ex2 <- generateArtificialLongData3d(
  nbEachClusters=c(5,10,20,40),
  meanTrajectories=list(
     function(t)c(t,t^3/100),
     function(t)c(0,t),
     function(t)c(t,t),
     function(t)c(0,t^3/100)
  ),
  residualVariation = function(t){c(rnorm(1,0,1),rnorm(1,0,1))}
)

plot3d(ex2,parTraj=parTRAJ(col=rep(1:4,time=c(5,10,20,40))))



