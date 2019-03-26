library(solrad)


### Name: EOT
### Title: Equation of time
### Aliases: EOT
### Keywords: Equation of time value

### ** Examples


#Calculating equaiton of time for 365 day of the year

DOY <- 1:365

eot <- EOT(DOY)

plot(DOY, eot)




