library(facilitation)


### Name: spatialanimation
### Title: Function for ploting simulation as a gif
### Aliases: spatialanimation plotsnapshot

### ** Examples

data(twospecies)
spatialanimation(twospecies,draw=c(5,3),times=seq(0,10,1),movie.name="ts.gif")
data(twospecies)
plotsnapshot(twospecies,t=10)



