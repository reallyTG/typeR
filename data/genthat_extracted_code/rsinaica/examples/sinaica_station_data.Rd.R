library(rsinaica)


### Name: sinaica_station_data
### Title: Get air quality data from a single measuring station
### Aliases: sinaica_station_data

### ** Examples

stations_sinaica[which(stations_sinaica$station_name == "Xalostoc"), 1:5]
df <- sinaica_station_data(271, "O3", "2015-09-11", "2015-09-11", "Crude")
head(df)




