library(weathercan)


### Name: stations_dl
### Title: Get available stations
### Aliases: stations_dl stations_all

### ** Examples


## No test: 
 # Update stations data frame
 s <- stations_dl()

 # Use new data frame to search for stations
 stations_search("Winnipeg", stn = s)
## End(No test)




