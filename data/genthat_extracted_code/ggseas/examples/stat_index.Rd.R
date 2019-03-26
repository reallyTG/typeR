library(ggseas)


### Name: stat_index
### Title: Index Stat
### Aliases: stat_index

### ** Examples

ap_df <- tsdf(AirPassengers)

ggplot(ldeaths_df, aes(x = YearMon, y = deaths, color = sex)) +
   stat_index(index.ref = 1:12, index.basis = 1000) +
   ylab("Deaths index\n(average of first 12 months = 1000")
   



