library(rtweet)


### Name: ts_plot
### Title: Plots tweets data as a time series-like data object.
### Aliases: ts_plot

### ** Examples


## Not run: 
##D 
##D ## search for tweets containing "rstats"
##D rt <- search_tweets("rstats", n = 10000)
##D 
##D ## plot frequency in 1 min intervals
##D ts_plot(rt, "mins")
##D 
##D ## plot multiple time series--retweets vs non-retweets
##D rt %>%
##D   dplyr::group_by(is_retweet) %>%
##D   ts_plot("hours")
##D 
##D ## compare account activity for some important US political figures
##D tmls <- get_timeline(
##D   c("SenSchumer", "SenGillibrand", "realDonaldTrump"),
##D   n = 3000
##D )
##D 
##D ## examine all twitter activity using weekly intervals
##D ts_plot(tmls, "weeks")
##D 
##D ## group by screen name and plot each time series
##D ts_plot(dplyr::group_by(tmls, screen_name), "weeks")
##D 
##D ## group by screen name and is_retweet
##D tmls %>%
##D   dplyr::group_by(tmls, screen_name, is_retweet) %>%
##D   ts_plot("months")
##D 
## End(Not run)



