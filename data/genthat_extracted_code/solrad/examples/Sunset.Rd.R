library(solrad)


### Name: Sunset
### Title: Sunset Time
### Aliases: Sunset
### Keywords: Sunset

### ** Examples


#Calculating sunset time for 365 day of the year for 45 degree latitude

DOY <- 1:365

Lat = 45

sunset <- Sunset(DOY, Lat)

plot(DOY, sunset)




