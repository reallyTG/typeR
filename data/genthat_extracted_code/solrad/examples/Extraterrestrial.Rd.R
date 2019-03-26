library(solrad)


### Name: Extraterrestrial
### Title: Solar Extraterrestrial Radiation
### Aliases: Extraterrestrial
### Keywords: Extraterrestrial Radiation Solar

### ** Examples


#Calculating solar extraterrestrial radiation for 365 day of the year

DOY <- 1:365

Sextr <- Extraterrestrial(DOY)

plot(DOY, Sextr)




