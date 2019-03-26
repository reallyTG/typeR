library(agridat)


### Name: waynick.soil
### Title: Soil nitrogen and carbon in two fields
### Aliases: waynick.soil
### Keywords: datasets

### ** Examples


data(waynick.soil)
dat <- waynick.soil

# Strong relationship between N,C
require(lattice)
xyplot(nitro~carbon|field, data=dat, main="waynick.soil")

# Spatial plot
if(require(sp) & require(gstat)){
d1 <- subset(dat, field=="Davis")
d2 <- subset(dat, field=="Oakley")
coordinates(d1) <- data.frame(x=d1$x, y=d1$y)
coordinates(d2) <- data.frame(x=d2$x, y=d2$y)
spplot(d1, zcol = "nitro", cuts=8, cex = 1.6,
       main = "waynick.soil - Davis field - nitrogen",
       col.regions =  bpy.colors(8), key.space = "right")

# Variogram
v1 <- gstat::variogram(nitro~1, data=d1)
plot(v1, main="waynick.soil - Davis field - nitrogen") # Maybe hasn't reached sill
}




