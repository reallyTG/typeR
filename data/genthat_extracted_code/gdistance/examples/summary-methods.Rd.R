library(gdistance)


### Name: Summary-methods
### Title: Summary methods
### Aliases: Summary-methods sum,TransitionStack-method
###   mean,TransitionStack-method
### Keywords: methods spatial

### ** Examples

#Create a new raster and set all its values to unity.
raster <- raster(nrows=18, ncols=36) 
raster <- setValues(raster,rep(1,ncell(raster)))

#Create a Transition object from the raster
tr <- transition(raster,mean,4)

trS <- stack(tr, tr*2)

#Apply a Summary method
trSum <- sum(trS)

#plot(raster(trMean))



