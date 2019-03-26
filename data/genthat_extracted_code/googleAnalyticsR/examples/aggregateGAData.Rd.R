library(googleAnalyticsR)


### Name: aggregateGAData
### Title: Aggregate a Google Analytics dataframe over inputted columns
### Aliases: aggregateGAData

### ** Examples


## Not run: 
##D 
##D # use `aggregateGAData` so you can on the fly create summary data
##D ga_data <- google_analytics(81416156, 
##D                             date_range = c("10daysAgo", "yesterday"),
##D                             metrics = "sessions", dimensions = c("hour","date"))
##D                             
##D # if we want totals per hour over the dates:
##D aggregateGAData(ga_data[,c("hour","sessions")], agg_names = "hour")
##D 
##D # it knows not to sum metrics that are rates:
##D aggregateGAData(ga_data[,c("hour","bounceRate")], agg_names = "hour")
##D 
##D 
## End(Not run)



