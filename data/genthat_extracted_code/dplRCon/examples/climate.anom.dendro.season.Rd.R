library(dplRCon)


### Name: climate.anom.dendro.season
### Title: Seasonal Data
### Aliases: climate.anom.dendro.season

### ** Examples

data(SOI)  # this is the Southern Oscillation Index data loaded with this package.
data(temperature) # this is the temperature data loaded with this package.
data(precipitation) # this is the precipitation data loaded with this package.
SOI.anom.season.data  <- climate.anom.dendro.season( SOI, 1933, 1992, 1876,
    is.anomaly="TRUE")
temp.anom.season.data	<- climate.anom.dendro.season( temperature, 1933, 1992, 1876,
   is.anomaly="TRUE")
prec.anom.season.data	<- climate.anom.dendro.season( precipitation, 1933, 1992, 1876,
   is.anomaly="TRUE")



