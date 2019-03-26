library(metR)


### Name: GetSMNData
### Title: Get Meteorological data
### Aliases: GetSMNData

### ** Examples

## Not run: 
##D dates <- seq.Date(lubridate::today() - 30, lubridate::today(), by = "1 day")
##D data <- GetSMNData(dates, type = "daily", bar = TRUE)
##D 
##D library(ggplot2)
##D ggplot(subset(data, station == "BASE BELGRANO II"),
##D        aes(date, (tmax + tmin)/2)) +
##D     geom_line()
## End(Not run)




