library(solrad)


### Name: Declination
### Title: Declination Angle
### Aliases: Declination
### Keywords: Angle Declination Solar

### ** Examples


#Calculating solar declination angle for 365 day of the year

DOY <- 1:365

delta <- Declination(DOY)

plot(DOY, delta)




