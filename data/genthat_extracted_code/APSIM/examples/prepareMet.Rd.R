library(APSIM)


### Name: prepareMet
### Title: Convert raw data to the correct APSIM met format.
### Aliases: prepareMet

### ** Examples

data(Kingsthorpe)
newNames <-c("Date", "maxt", "mint", "rain", "evaporation", "radn", "vp", "Wind", "RH", "SVP")
units <- c("()", "(oC)", "(oC)", "(mm)", "(mm)", "(MJ/m^2/day)", "()", "()", "()", "()")
prepareMet(kingsData, -27.48, 151.81, newNames = newNames, units = units)



