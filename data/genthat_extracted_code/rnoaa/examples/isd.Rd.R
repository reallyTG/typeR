library(rnoaa)


### Name: isd
### Title: Get and parse NOAA ISD/ISH data
### Aliases: isd

### ** Examples

## Not run: 
##D # Get station table
##D (stations <- isd_stations())
##D 
##D ## plot stations
##D ### remove incomplete cases, those at 0,0
##D df <- stations[complete.cases(stations$lat, stations$lon), ]
##D df <- df[df$lat != 0, ]
##D ### make plot
##D library("leaflet")
##D leaflet(data = df) %>%
##D   addTiles() %>%
##D   addCircles()
##D 
##D # Get data
##D (res <- isd(usaf="011490", wban="99999", year=1986))
##D (res <- isd(usaf="011690", wban="99999", year=1993))
##D (res <- isd(usaf="109711", wban=99999, year=1970))
##D 
##D # "additional" and "remarks" data sections included by default
##D # can toggle that parameter to not include those in output, saves time
##D (res1 <- isd(usaf="011490", wban="99999", year=1986, force = TRUE))
##D (res2 <- isd(usaf="011490", wban="99999", year=1986, force = TRUE,
##D   additional = FALSE))
##D 
##D # The first time a dataset is requested takes longer
##D system.time( isd(usaf="782680", wban="99999", year=2011) )
##D system.time( isd(usaf="782680", wban="99999", year=2011) )
##D 
##D # Optionally pass in curl options
##D res <- isd(usaf="011490", wban="99999", year=1986, config = verbose())
##D 
##D # Plot data
##D ## get data for multiple stations
##D res1 <- isd(usaf="011690", wban="99999", year=1993)
##D res2 <- isd(usaf="172007", wban="99999", year=2015)
##D res3 <- isd(usaf="702700", wban="00489", year=2015)
##D res4 <- isd(usaf="109711", wban=99999, year=1970)
##D ## combine data
##D library(dplyr)
##D res_all <- bind_rows(res1, res2, res3, res4)
##D # add date time
##D library("lubridate")
##D res_all$date_time <- ymd_hm(
##D   sprintf("%s %s", as.character(res_all$date), res_all$time)
##D )
##D ## remove 999's
##D res_all <- res_all %>% filter(temperature < 900)
##D ## plot
##D library("ggplot2")
##D ggplot(res_all, aes(date_time, temperature)) +
##D   geom_line() +
##D   facet_wrap(~usaf_station, scales = "free_x")
##D 
##D # print progress
##D (res <- isd(usaf="011690", wban="99999", year=1993, progress=TRUE))
##D 
##D # parallelize processing
##D (res <- isd(usaf="172007", wban="99999", year=2015, parallel=TRUE))
## End(Not run)



