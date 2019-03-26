library(secr)


### Name: capthist.parts
### Title: Dissect Spatial Capture History Object
### Aliases: animalID occasion trap alive xy alongtransect xy<- telemetryxy
###   telemetryxy<- telemetered
### Keywords: manip

### ** Examples


## `captdata' is a demonstration dataset
animalID(captdata)

temp <- sim.capthist(popn = list(D = 1), make.grid(detector
    = "count"))
cbind(ID = as.numeric(animalID(temp)), occ = occasion(temp),
    trap = trap(temp))




