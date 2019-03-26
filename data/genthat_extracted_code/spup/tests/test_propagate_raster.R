# test -- propagate()

library(spup)
library(raster)

# create dummy rasters
set.seed(654321)
# create var1
sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = rnorm(9))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDF1 <- raster(sdf)

sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = runif(9))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDFsd1 <- raster(sdf)

# create var2
sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = rnorm(9,100,1))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDF2 <- raster(sdf)
# sd for the second var
sdf <- data.frame(x = rep(0:2, each = 3),
                  y = rep(0:2, 3),
                  l = rnorm(9,10,0.5))
coordinates(sdf) <- ~ x + y
gridded(sdf) <- TRUE
rasterDFsd2 <- raster(sdf)

# define UM and run sampling
crm1 <- makeCRM(0.8, 200, "Sph")
UM1 <- defineUM(TRUE, distribution = "norm", crm = crm1,
                distr_param = c(rasterDF1, rasterDFsd2))
UM2 <- defineUM(TRUE, "norm", c(rasterDF2, rasterDFsd2)) 
var1 <- genSample(UM1, 10, "ugs")
var2 <- genSample(UM2, 10, "randomSampling")

# run propagation
some_model <- function(A, B) {
  C <- A*B
  C
}
out <- propagate(list(var1, var2), some_model, 10)
summary(out)

some_model <- function(A) A*2
out <- propagate(var1, some_model, 10)
summary(out)



