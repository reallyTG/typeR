library(virtualspecies)


### Name: limitDistribution
### Title: Limit a virtual species distribution to a defined area
### Aliases: limitDistribution

### ** Examples

# Create an example stack with six environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100),
             raster(a * logisticFun(1:100, alpha = 10, beta = 70)),
             raster(t(a)),
             raster(exp(a)),
             raster(log(a)))
names(env) <- paste("Var", 1:6, sep = "")   

# More than 6 variables: by default a PCA approach will be used
sp <- generateRandomSp(env)

# limiting the distribution to a specific extent
limit <- extent(0.5, 0.7, 0.6, 0.8)

limitDistribution(sp, area = limit)


# Example of a raster of habitat patches
habitat.raster <- setValues(sp$pa.raster, 
                          sample(c(0, 1), size = ncell(sp$pa.raster), replace = TRUE))

plot(habitat.raster) # 1 = suitable habitat; 0 = unsuitable habitat
sp <- limitDistribution(sp, geographical.limit = "raster", area = habitat.raster)
par(mfrow = c(2, 1))
plot(sp$pa.raster)
plot(sp$occupied.area) # Species could not occur in many cells because
# habitat patches were unsuitable



