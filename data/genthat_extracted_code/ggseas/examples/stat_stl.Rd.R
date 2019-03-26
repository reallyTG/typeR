library(ggseas)


### Name: stat_stl
### Title: LOESS seasonal adjustment Stat
### Aliases: stat_stl

### ** Examples

ap_df <- tsdf(AirPassengers)

# periodic if fixed seasonality; doesn't work well:
ggplot(ap_df, aes(x = x, y = y)) +
   stat_stl(s.window = "periodic")

# seasonality varies a bit over time, works better:
ggplot(ap_df, aes(x = x, y = y)) +
   stat_stl(s.window = 7)

# Multiple time series example:
ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
   geom_point() +
   facet_wrap(~sex) +
   stat_stl(s.window = 7) +
   ggtitle("Seasonally adjusted lung deaths")

# Index so first value is 100:
ggplot(ap_df, aes(x = x, y = y)) +
   stat_stl(s.window = 7, index.ref = 1)



