library(VFS)


### Name: read.dly
### Title: Read GHCN DLY daily weather file into a data frame
### Aliases: read.dly
### Keywords: IO

### ** Examples

# ten years of daily weather data, 2000-2009, for State College, PA
weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))

# could also use: 
# weather <- read.dly("ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/all/USC00368449.dly")
# weather <- subset(weather, YEAR >= 2000 & YEAR <= 2009)

# daily precipitation
summary(weather$PRCP.VALUE)

# monthly average maximum temperature
aggregate(TMAX.VALUE ~ MONTH, FUN = mean, data = weather)

# generate simulation values
weather.params <- wth.param(weather)



