library(kml)


### Name: generateArtificialLongData
### Title: ~ Function: generateArtificialLongData (or gald) ~
### Aliases: gald generateArtificialLongData
### Keywords: datagen cluster ts

### ** Examples

par(ask=TRUE)


#####################
### Default example

(ex1 <- generateArtificialLongData())
plot(ex1)
plot(ex1,parTraj=parTRAJ(col=rep(2:5,each=50)))


#####################
### Three diverging lines

ex2 <- generateArtificialLongData(meanTrajectories=list(function(t)0,function(t)-t,function(t)t))
plot(ex2,parTraj=parTRAJ(col=rep(2:4,each=50)))


#####################
### Three diverging lines with high variance, unbalance groups and missing value

ex3 <- generateArtificialLongData(
   meanTrajectories=list(function(t)0,function(t)-t,function(t)t),
   nbEachClusters=c(100,30,10),
   residualVariation=function(t){rnorm(1,0,3)},
   percentOfMissing=c(0.25,0.5,0.25)
)
part3 <- partition(rep(1:3,c(100,30,10)))
plot(ex3,parTraj=parTRAJ(col=rep(2:4,c(100,30,10))))


#####################
### Four strange functions

ex4 <- generateArtificialLongData(
    nbEachClusters=c(300,200,100,100),
    meanTrajectories=list(function(t){-10+2*t},function(t){-0.6*t^2+6*t-7.5},
       function(t){10*sin(t)},function(t){30*dnorm(t,2,1.5)}),
    residualVariation=function(t){rnorm(1,0,3)},
    time=0:10,decimal=2,percentOfMissing=0.3)
plot(ex4,parTraj=parTRAJ(col=rep(2:5,c(300,200,100,100))))


#####################
### To get only longData (if you want some artificial longData
###    to deal with another algorithm), use the getteur ["traj"]

ex5 <- gald(nbEachCluster=3,time=1:3)
ex5["traj"]

par(ask=FALSE)



