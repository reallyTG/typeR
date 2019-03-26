library(ggseas)


### Name: stat_seas
### Title: X13 seasonal adjustment Stat
### Aliases: stat_seas

### ** Examples

## Not run: 
##D ap_df <- tsdf(AirPassengers)
##D 
##D # SEATS with defaults:
##D ggplot(ap_df, aes(x = x, y = y)) +
##D    stat_seas()
##D    
##D # X11 with no outlier treatment:
##D ggplot(ap_df, aes(x = x, y = y)) +
##D   stat_seas(x13_params = list(x11 = "", outlier = NULL))
##D 
##D # Multiple time series example:    
##D ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
##D   geom_point() +
##D   facet_wrap(~sex) +
##D   stat_seas() +
##D   ggtitle("Seasonally adjusted lung deaths")
##D   
##D # example use of index:  
##D ggplot(ap_df, aes(x = x, y = y)) +
##D   stat_seas(x13_params = list(x11 = "", outlier = NULL),
##D   index.ref = 1, index.basis = 1000) +
##D   labs(y = "Seasonally adjusted index\n(first observation = 1000)")
##D   
##D # if the x value is not a decimal eg not created with time(your_ts_object),
##D # you need to specify start and frequency by hand:
##D ggplot(subset(nzbop, Account == "Current account"), 
##D       aes(x = TimePeriod, y = Value)) +
##D    stat_seas(start = c(1971, 2), frequency = 12) +
##D    facet_wrap(~Category, scales = "free_y")
##D   
##D   
## End(Not run)



