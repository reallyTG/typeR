library(rtweet)


### Name: ts_data
### Title: Converts tweets data into time series-like data object.
### Aliases: ts_data

### ** Examples


## Not run: 
##D 
##D ## handles of women senators
##D sens <- c("SenatorBaldwin", "SenGillibrand", "PattyMurray", "SenatorHeitkamp")
##D 
##D ## get timelines for each
##D sens <- get_timeline(sens, n = 3200)
##D 
##D ## get single time series for tweets
##D ts_data(sens)
##D 
##D ## using weekly intervals
##D ts_data(sens, "weeks")
##D 
##D ## group by screen name and then use weekly intervals
##D sens %>%
##D   dplyr::group_by(screen_name) %>%
##D   ts_plot("weeks")
##D 
## End(Not run)




