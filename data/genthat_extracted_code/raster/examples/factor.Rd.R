library(raster)


### Name: factors
### Title: Factors
### Aliases: is.factor is.factor,Raster-method is.factor,RasterStack-method
###   as.factor as.factor,RasterLayer-method levels levels,Raster-method
###   levels,RasterStack-method levels<- levels<-,Raster-method asFactor
###   asFactor,RasterLayer-method factorValues ratify deratify
### Keywords: methods spatial

### ** Examples

set.seed(0)
r <- raster(nrow=10, ncol=10)
r[] <- runif(ncell(r)) * 10
is.factor(r)

r <- round(r)
f <- as.factor(r)
is.factor(f)

x <- levels(f)[[1]]
x
x$code <- letters[10:20]
levels(f) <- x
levels(f)
f

r <- raster(nrow=10, ncol=10)
r[] = 1
r[51:100] = 2
r[3:6, 1:5] = 3
r <- ratify(r)

rat <- levels(r)[[1]]
rat$landcover <- c('Pine', 'Oak', 'Meadow')
rat$code <- c(12,25,30)
levels(r) <- rat
r

# extract values for some cells
i <- extract(r, c(1,2, 25,100))
i
# get the attribute values for these cells
factorValues(r, i)

# write to file:
rr <- writeRaster(r, 'test.grd', overwrite=TRUE)
rr

# create a single-layer factor 
x <- deratify(r, 'landcover')
x
is.factor(x)
levels(x)



