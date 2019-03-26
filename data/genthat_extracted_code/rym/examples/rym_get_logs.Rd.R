library(rym)


### Name: rym_get_logs
### Title: Get raw data from yandex metrika.
### Aliases: rym_get_logs

### ** Examples

## Not run: 
##D # where "00000000" is your counter id
##D rawmetrikdata <- rym_get_logs(counter = "00000000",
##D                               date.from = "2016-12-01",
##D                               date.to = "2016-12-20",
##D                               fields = "ym:s:visitID,
##D 							            ym:s:date,
##D 										ym:s:bounce,
##D 										ym:s:clientID,
##D 										ym:s:networkType",
##D                               source = "visits")
## End(Not run)



