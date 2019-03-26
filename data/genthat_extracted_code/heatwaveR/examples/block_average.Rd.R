library(heatwaveR)


### Name: block_average
### Title: Calculate yearly means for event metrics.
### Aliases: block_average

### ** Examples

ts <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res <- detect_event(ts)
out <- block_average(res)
summary(glm(count ~ year, out, family = "poisson"))

library(ggplot2)

ggplot(data = out, aes(x = year, y = count)) +
  geom_point(colour = "salmon") +
  geom_line() +
  labs(x = NULL, y = "Number of events")




