library(rEMM)


### Name: build
### Title: Building an EMM using New Data
### Aliases: build build,EMM,data.frame-method build,EMM,matrix-method
###   build,EMM,numeric-method
### Keywords: models

### ** Examples


## load EMMTraffic data
data("EMMTraffic")
EMMTraffic

## create EMM
emm <- EMM(measure="eJaccard", threshold=0.2)

## build model using EMMTraffic data (note that the EMM object is 
## changed without assignment!)
build(emm, EMMTraffic)
## same as: emm <- build(emm, EMMTraffic)

size(emm)
plot(emm)

## emm2 <- emm does not create a copy (just a reference)
## a "deep" copy is created using copy()
emm2<- copy(emm) 

## convert the emm into a graph
as.igraph(emm)



