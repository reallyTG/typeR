library(ClamR)


### Name: climate
### Title: Climate Record At Croig Cave
### Aliases: climate
### Keywords: datasets

### ** Examples

data(climate)
climate_month <- climate$overall
climate_temp <- climate$Temperature

plot(climate_month,climate_temp,type="l",
    xlab="month",ylab=expression(paste("Temperature ("^"o","C)")))





