library(water)


### Name: read.WSdata
### Title: Prepares weather station data
### Aliases: read.WSdata

### ** Examples

csvfile <- system.file("extdata", "apples.csv", package="water")
MTLfile <- system.file("extdata", "L7.MTL.txt", package="water")
WS <- read.WSdata(WSdata = csvfile, date.format = "%d/%m/%Y", 
                  lat=-35.42222, long= -71.38639, elev=201, height= 2.2,
                  columns=c("date" = 1, "time" = 2, "radiation" = 3,
                  "wind" = 4, "RH" = 6, "temp" = 7, "rain" = 8), 
                  MTL = MTLfile)
print(WS)
plot(WS, alldata=FALSE)
plot(WS, alldata=TRUE)



