library(MODISTools)


### Name: sin_to_ll
### Title: Convert sinusoidal coordinates to lat / lon
### Aliases: sin_to_ll
### Keywords: Land MODIS Products Subsets, meta-data products,

### ** Examples


## No test: 
# Download some test data
subset <- mt_subset(product = "MOD11A2",
                        lat = 40,
                        lon = -110,
                        band = "LST_Day_1km",
                        start = "2004-01-01",
                        end = "2004-03-31",
                        progress = FALSE)

# convert sinusoidal to lat / lon
lat_lon <- sin_to_ll(subset$xllcorner, subset$yllcorner)

# bind with the original dataframe
subset <- cbind(subset, lat_lon)
head(subset)
## End(No test)



