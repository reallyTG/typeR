# test -- genSample()

library(spup)
library(raster)

# create dummy rasters
set.seed(1234567)
# mean
sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = rnorm(9))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDF <- raster(sdf)
# sd
sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = runif(9))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDFsd <- raster(sdf)

# define UM
UM <- defineUM(TRUE, distribution = "norm", distr_param = c(rasterDF, rasterDFsd))
a <- genSample(UM, 10, "randomSampling", asList = FALSE)
plot(a)
