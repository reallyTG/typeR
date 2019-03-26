library(MODISTools)


### Name: mt_bbox
### Title: Converts lower-left sinusoidal coordinates to lat-lon sf
###   bounding box
### Aliases: mt_bbox
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

# convert to bounding box
bb <- apply(subset, 1, function(x){
  mt_bbox(xllcorner = x['xllcorner'],
          yllcorner = x['yllcorner'],
          cellsize = x['cellsize'],
          nrows = x['nrows'],
          ncols = x['ncols'])
})

head(bb)
## End(No test)



