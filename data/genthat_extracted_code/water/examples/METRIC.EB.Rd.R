library(water)


### Name: METRIC.EB
### Title: Estimates Energy Balance using METRIC2010 Model
### Aliases: METRIC.EB

### ** Examples

### Data preparation
library(water)
aoi <- createAoi(topleft = c(500000, -3644000), bottomright = c(526000, -3660000))
raw_data_folder <- system.file("extdata", package="water")
image <- loadImage(path=raw_data_folder, aoi=aoi, sat="L8")
image.SR <- loadImageSR(path=raw_data_folder, aoi=aoi)
csvfile <- system.file("extdata", "INTA.csv", package="water")
MTLfile <- system.file("extdata", "LC82320832016040LGN00_MTL.txt", package="water")
## Not run: 
##D WeatherStation <- read.WSdata(WSdata = csvfile, 
##D                               datetime.format =  "%Y/%m/%d %H:%M", 
##D                               columns = c("datetime", "temp",
##D                                           "RH", "pp", "radiation", "wind"), 
##D                               lat=-33.00513, long= -68.86469, elev=927, height= 2,
##D                               MTL=MTLfile)
##D                               
##D ### LSEB with default methods and no extra parameters                               
##D Energy.Balance <- METRIC.EB(image.DN = image, image.SR = image.SR,
##D                             plain=TRUE, aoi=aoi, n = 5, WeatherStation = WeatherStation, 
##D                             ETp.coef = 1.2, sat="L8", alb.coeff = "Olmedo", LST.method = "SW", 
##D                             LAI.method = "metric2010", Z.om.ws = 0.03, MTL = MTLfile)
##D                             
##D                             
##D ### LSEB with "Perrier" method for Zom and extra parameters                               
##D Energy.Balance <- METRIC.EB(image.DN = image, image.SR = image.SR,
##D                             plain=TRUE, aoi=aoi, n = 5, WeatherStation = WeatherStation, 
##D                             ETp.coef = 1.2, sat="L8", alb.coeff = "Olmedo", LST.method = "SW", 
##D                             LAI.method = "metric2010", Zom.method = "Perrier", Z.om.ws = 0.03, 
##D                             MTL = MTLfile, extraParameters = c(fLAI = 0.5, h = 1.8) ) 
## End(Not run)



