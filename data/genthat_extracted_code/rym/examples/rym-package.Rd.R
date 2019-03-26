library(rym)


### Name: rym-package
### Title: R Interface to Yandex Metrica API
### Aliases: rym-package rym

### ** Examples

## Not run: 
##D library(rym)
##D 
##D # get counters list
##D my_counters <- rym_get_counter()
##D 
##D # join all counters id in string format, like 1,2,3,4,5,...,n
##D counters_ids <- paste0(my_counters$id, collapse = ",")
##D 
##D # get statistic from reporting API
##D reporting <- rym_get_data(counters   = counters_ids,
##D                           date.from  = "2018-08-01",
##D                           date.to    = "yesterday",
##D                           dimensions = "ym:s:date,
##D 				                        ym:s:lastTrafficSource",
##D                           metrics    = "ym:s:visits,
##D 						                ym:s:pageviews,
##D 						                ym:s:users",
##D                           sort       = "-ym:s:date")
##D 						  
##D # get raw data
##D raw_data <- rym_get_logs(counter = counters_ids[1],
##D                               date.from = "2016-12-01",
##D                               date.to = "2016-12-20",
##D                               fields = "ym:s:visitID,
##D 							            ym:s:date,
##D 										ym:s:bounce,
##D 										ym:s:clientID,
##D 										ym:s:networkType",
##D                               source = "visits")
## End(Not run)



