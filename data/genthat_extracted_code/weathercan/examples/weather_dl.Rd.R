library(weathercan)


### Name: weather_dl
### Title: Download weather data from Environment Canada
### Aliases: weather_dl weather

### ** Examples


## No test: 
kam <- weather_dl(station_ids = 51423,
                  start = "2016-01-01", end = "2016-02-15")
## End(No test)

stations_search("Kamloops A$", interval = "hour")
stations_search("Prince George Airport", interval = "hour")
## No test: 
kam.pg <- weather_dl(station_ids = c(48248, 51423),
                     start = "2016-01-01", end = "2016-02-15")

library(ggplot2)

ggplot(data = kam.pg, aes(x = time, y = temp,
                          group = station_name,
                          colour = station_name)) +
       geom_line()
## End(No test)




