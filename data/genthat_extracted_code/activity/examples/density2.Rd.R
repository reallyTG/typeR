library(activity)


### Name: density2
### Title: Modified kernel density function
### Aliases: density2

### ** Examples

data(BCItime)
tm <- subset(BCItime, species=="ocelot")$time
dens <- density2(tm, from=0.25, to=0.75)
plot(dens$x, dens$y, type="l")



