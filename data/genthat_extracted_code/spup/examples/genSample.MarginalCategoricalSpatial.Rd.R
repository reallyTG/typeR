library(spup)


### Name: genSample.MarginalCategoricalSpatial
### Title: Generating Monte Carlo sample from an uncertain object of a
###   class 'MarginalCategoricalSpatial'
### Aliases: genSample.MarginalCategoricalSpatial

### ** Examples


set.seed(12345)
# load data
data(woon)
woonUM <- defineUM(TRUE, categories = c(1,2,3), cat_prob = woon[, c(4:6)])
woon_sample <- genSample(woonUM, 10, asList = FALSE)
class(woon_sample)
str(woon_sample@data)
woon_sample <- genSample(woonUM, 10)
class(woon_sample)

# analyse probability of having snow
# load data
data(dem30m, dem30m_sd)

# generate dummy probabilities for categories "snow" and "no snow"
dem30m$snow_prob <- NA
dem30m$snow_prob[dem30m$Elevation > 1000] <- 0.75
dem30m$snow_prob[dem30m$Elevation <= 1000] <- 0.25
dem30m$no_snow_prob <- 1 - dem30m$snow_prob
summary(dem30m@data)
snowUM <- defineUM(uncertain = TRUE, categories = c("snow", "no snow"), cat_prob = dem30m[2:3])
class(snowUM)
snow_sample <- genSample(snowUM, 10, asList = FALSE)
head(snow_sample@data)

# case with raster
# load data
data(dem30m, dem30m_sd)
dem30m$snow_prob <- NA
dem30m$snow_prob[dem30m$Elevation > 1000] <- 0.75
dem30m$snow_prob[dem30m$Elevation <= 1000] <- 0.25
dem30m$no_snow_prob <- 1 - dem30m$snow_prob
summary(dem30m@data)
dem_stack <- raster::stack(dem30m)
snowUM <- defineUM(uncertain = TRUE, categories = c("snow", "no snow"), cat_prob = dem_stack[[2:3]])
snow_sample <- genSample(snowUM, 10, asList = FALSE)
require(sp)
spplot(snow_sample)




