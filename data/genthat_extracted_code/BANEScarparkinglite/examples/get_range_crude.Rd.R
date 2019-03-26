library(BANEScarparkinglite)


### Name: get_range_crude
### Title: Download records from a specified range from the Bath: Hacked
###   datastore
### Aliases: get_range_crude

### ** Examples

# Records for 1st June 2016
raw_data <- get_range_crude("2016-06-01 00:00:00", "2016-06-01 23:59:59")
## No test: 
# All records from Podium CP since 14:30 on 1st January 2017
raw_data <- get_range_crude(from = "2017-01-01 14:30:00", abbrs = "p")

# All records from P+Rs before 2015
raw_data <- get_range_crude(to = "2014-12-31 23:59:59", abbrs = c("l", "n", "od"))
## End(No test)



