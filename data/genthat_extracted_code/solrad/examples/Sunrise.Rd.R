library(solrad)


### Name: Sunrise
### Title: Sunrise Time
### Aliases: Sunrise
### Keywords: Sunrise

### ** Examples


#Calculating sunrise time for 365 day of the year for 45 degree latitude

DOY <- 1:365

Lat = 45

sunrise <- Sunset(DOY, Lat)

plot(DOY, sunrise)




