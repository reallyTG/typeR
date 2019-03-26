library(GEOmap)


### Name: antipolygon
### Title: Fill the complement of a polygon
### Aliases: antipolygon
### Keywords: aplot

### ** Examples

x = runif(100)
y = runif(100)

#########  some data points to plot:

plot(x,y)
###########   create polygon:
pp =list(x=c(0.231,0.316,0.169,0.343,0.311,0.484,0.757,
         0.555,0.800,0.563,0.427,0.412,0.203),
     y=c(0.774,0.622,0.401,0.386,0.138,0.312,0.200,0.459,
        0.658,0.624,0.954,0.686,0.813))

polygon(pp)

antipolygon(x=pp$x, y=pp$y,col='blue')
####  where as this does not look so good
plot(x,y)
antipolygon(x=pp$x, y=pp$y,col='blue', corner=2)






