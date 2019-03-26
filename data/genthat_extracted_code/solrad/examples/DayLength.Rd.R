library(solrad)


### Name: DayLength
### Title: Day Length
### Aliases: DayLength
### Keywords: Day Length

### ** Examples


#Calculating day length for 365 day of the year for 45 degree latitude

DOY <- 1:365

Lat = 45

dl <- DayLength(DOY, Lat)

plot(DOY, dl)




