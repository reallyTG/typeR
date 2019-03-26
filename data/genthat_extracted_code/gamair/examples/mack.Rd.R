library(gamair)


### Name: mack
### Title: Egg data from 1992 mackerel survey
### Aliases: mack
### Keywords: data

### ** Examples

data(mack)
# plot the egg densities against location
plot(mack$lon,mack$lat,cex=0.2+mack$egg.dens/150,col="red")



