library(ggseas)


### Name: stat_rollapplyr
### Title: Rolling summary Stat
### Aliases: stat_rollapplyr

### ** Examples

ap_df <- tsdf(AirPassengers)

ggplot(ap_df, aes(x = x, y = y)) +
   stat_rollapplyr(width = 12)
   
# rolling average after converting to an index, 1000 = average value
# in the first 12 months.
ggplot(ap_df, aes(x = x, y = y)) +
   stat_rollapplyr(width = 12, index.ref = 1:12, index.basis = 1000)

ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
  geom_point() +
  facet_wrap(~sex) +
  stat_rollapplyr(width = 12, FUN = median) +
  ggtitle("Seasonally adjusted lung deaths")




