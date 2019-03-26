library(gamair)


### Name: coast
### Title: European coastline from -11 to 0 East and from 43 to 59 North
### Aliases: coast
### Keywords: data

### ** Examples

data(coast)
# plot the entire coast .....
plot(coast$lon,coast$lat,type="l")
# or draw it clipped to  whatever the current plot is....
lines(coast$lon,coast$lat,col="blue")



