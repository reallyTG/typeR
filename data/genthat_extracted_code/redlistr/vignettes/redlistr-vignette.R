## ----Loading packages, message=FALSE-------------------------------------
library(rgeos)
library(rgdal)
library(redlistr)

## ----Loading our example distributions-----------------------------------
mangrove.2000 <- raster(system.file("extdata", "example_distribution_2000.tif", 
                                    package = "redlistr"))
mangrove.2017 <- raster(system.file("extdata", "example_distribution_2017.tif", 
                                    package = "redlistr"))

## ----Importing shapefile, eval=FALSE-------------------------------------
#  library(rgdal)
#  my.shapefile <- readOGR('./path/to/folder/', 'shapefile.shp')
#  my.KML.file <- readOGR('./path/to/folder/kmlfile.kml')

## ----Plotting the two rasters, fig.show='hold', fig.width=7, fig.height=7----
plot(mangrove.2000, col = "grey30", legend = FALSE, main = "Mangrove Distribution")
plot(mangrove.2017, add = T, col = "darkorange", legend = FALSE)

## ----Checking CRS--------------------------------------------------------
isLonLat(mangrove.2000) 
isLonLat(mangrove.2000)
# If TRUE, they must be reprojected to a projected coordinate system

crs(mangrove.2000)@projargs == crs(mangrove.2017)@projargs

## ----Calculate area of rasters-------------------------------------------
a.2000 <- getArea(mangrove.2000)
a.2000
a.2017 <- getArea(mangrove.2017)
a.2017

## ----Binary object from multiclass, eval=FALSE---------------------------
#  # Create dummy raster for example
#  r <- raster(nrows=10, ncols=10)
#  r.multiple <- r
#  values(r.multiple) <- rep(c(1:10), 10)
#  
#  # If the target ecosystem is represented by value = 5
#  r.bin <- r.multiple == 5 # Has values of 1 and 0
#  # Convert 0s to NAs
#  values(r.bin)[values(r.bin) != 1] <- NA

## ----Using getAreaChange-------------------------------------------------
area.lost <- getAreaLoss(a.2000, a.2017)
# getAreaLoss(mangrove.2000, mangrove.2017) generates identical results


## ----Using getDeclineStats-----------------------------------------------
decline.stats <- getDeclineStats(a.2000, a.2017, 2000, 2017, 
                                 methods = c('ARD', 'PRD', 'ARC'))
decline.stats

## ----Estimating future area----------------------------------------------
extrapolated.area <- futureAreaEstimate(a.2000, year.t1 = 2000, 
                                        ARD = decline.stats$ARD, 
                                        PRD = decline.stats$PRD, 
                                        ARC = decline.stats$ARC, 
                                        nYears = 50)
extrapolated.area

## ----Percent loss--------------------------------------------------------
predicted.percent.loss <- (extrapolated.area$A.PRD.t3 - a.2000)/a.2000 * 100
predicted.percent.loss

## ----Make EOO, fig.width=7, fig.height=7---------------------------------
EOO.polygon <- makeEOO(mangrove.2017)
plot(EOO.polygon)
plot(mangrove.2017, add = T, col = "green", legend = FALSE)

## ----Calculating EOO area------------------------------------------------
EOO.area <- getAreaEOO(EOO.polygon)
EOO.area

## ----Creating AOO grid, fig.width=7, fig.height=7------------------------
AOO.grid <- makeAOOGrid(mangrove.2017, grid.size = 10000,
                            min.percent.rule = F)
plot(AOO.grid)
plot(mangrove.2017, add = T, col = "green", legend = FALSE)

## ----Getting number of AOO grids-----------------------------------------
n.AOO <- length(AOO.grid)

# the getAOO function can also be used to directly get the AOO
# n.AOO <- getAOO(mangrove.2017, grid.size = 10000, 
#                 min.percent.rule = T, percent = 0.1)
n.AOO

## ----gridUncertainty-----------------------------------------------------
gU.results <- gridUncertainty(mangrove.2017, 10000,
                              n.AOO.improvement = 5, 
                              min.percent.rule = F)
# If it takes your computer very long to run this command, consider reducing 
# n.AOO.improvement

gU.results$min.AOO.df

## ----Plotting out minimum AOO grid, fig.width=7, fig.height=7------------
plot(gU.results$min.AOO.grid$out.grid)
plot(mangrove.2017, add = T, col = "green", legend = FALSE)

## ----One percent grid, fig.width=7, fig.height=7-------------------------
AOO.grid.one.percent <- makeAOOGrid(mangrove.2017, grid.size = 10000, 
                                    min.percent.rule = T, percent = 1)
plot(AOO.grid.one.percent)
plot(mangrove.2017, add = T, col = "green", legend = FALSE)

## ----AOO Grid 0.1percent, fig.width=7, fig.height=7----------------------
AOO.grid.min.percent <- makeAOOGrid(mangrove.2017, grid.size = 10000,
                                    min.percent.rule = T, percent = 0.1)
par(mfrow = c(2,2))
plot(AOO.grid, main = 'AOO grid without one percent rule')
plot(mangrove.2017, add = T, col = "green", legend = FALSE)
plot(AOO.grid.one.percent, main = 'AOO grid with one percent rule')
plot(mangrove.2017, add = T, col = "green", legend = FALSE)
plot(AOO.grid.min.percent, main = 'AOO grid with one percent rule at 0.1%')
plot(mangrove.2017, add = T, col = "green", legend = FALSE)

