library(macleish)


### Name: etl_extract.etl_macleish
### Title: Extract weather data
### Aliases: etl_extract.etl_macleish etl_transform.etl_macleish

### ** Examples


macleish <- etl("macleish")
str(macleish)

## Not run: 
##D macleish %>%
##D   etl_extract() %>%
##D   etl_transform() %>%
##D   etl_load()
##D whately <- macleish %>%
##D   tbl("whately") 
##D orchard <- macleish %>%
##D   tbl("orchard") 
##D   
##D whately %>%
##D   summarize(N = n(), avg_temp = mean(temperature))
##D orchard %>%
##D   summarize(N = n(), avg_temp = mean(temperature))
##D   
##D # check data types
##D whately %>%
##D   glimpse()
##D 
##D # if using SQLite, datetimes will get converted to integers
##D whately <- whately %>%
##D   mutate(when_datetime = datetime(when, 'unixepoch'))
##D whately %>%
##D   glimpse()
##D 
##D # show the most recent data -- should be within the past hour
##D whately %>%
##D   collect() %>%
##D   tail()
##D 
##D # show that no time-shifting is happening
##D if (require(ggplot2)) {
##D macleish %>%
##D   tbl("whately") %>%
##D   collect() %>%
##D   mutate(when = lubridate::ymd_hms(when)) %>%
##D   filter(lubridate::year(when) == 2012 & month(when) == 12 & day(when) == 20) %>%
##D   ggplot(aes(x = when, y = temperature)) + geom_line()
##D }
## End(Not run)



