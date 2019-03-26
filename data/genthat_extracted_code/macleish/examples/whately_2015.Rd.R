library(macleish)


### Name: whately_2015
### Title: Weather data from Macleish Field Stations
### Aliases: whately_2015 orchard_2015
### Keywords: datasets

### ** Examples


## Not run: 
##D #' # loose wire anomalies
##D if (require(dplyr) & require(ggplot2) & require(lubridate)) {
##D  orchard_2015 %>%
##D  filter(month(when) == 11) %>%
##D    ggplot(aes(x = when, y = temperature)) +
##D    geom_line() + geom_smooth()
##D }
## End(Not run)



