library(BayesianAnimalTracker)


### Name: DegToKM
### Title: Convert between the latitude and longitude in degrees and
###   Northing and Easting in kilometers (KM).
### Aliases: DegToKM KMToDeg
### Keywords: degree northing easting

### ** Examples

data(Trip1GPS)
GPSformat <- GPStable(Trip1GPS)
GPSinKM <- DegToKM(GPSformat)
#Convert the degree into kilometers.
GPSdeg <- KMToDeg(GPSinKM[, 2:3], GPSformat[1, c(3, 2)])
#Convert the kilometers back into degrees.
#More comprehensive examples can be found by help(Trip1)



