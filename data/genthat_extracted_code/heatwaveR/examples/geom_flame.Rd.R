library(heatwaveR)


### Name: geom_flame
### Title: Create 'flame' polygons.
### Aliases: geom_flame

### ** Examples

ts <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res <- detect_event(ts)
mhw <- res$clim
mhw <- mhw[10580:10690,]

library(ggplot2)

ggplot(mhw, aes(x = t, y = temp)) +
  geom_flame(aes(y2 = thresh)) +
  geom_text(aes(x = as.Date("2011-02-01"), y = 28,
            label = "That's not a heatwave.\nThis, is a heatwave.")) +
  xlab("Date") + ylab(expression(paste("Temperature [", degree, "C]")))




