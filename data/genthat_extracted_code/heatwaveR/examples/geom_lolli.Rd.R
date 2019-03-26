library(heatwaveR)


### Name: geom_lolli
### Title: Visualise a timeline of several event metrics as 'lollipops'.
### Aliases: geom_lolli

### ** Examples

ts <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res <- detect_event(ts)
mhw <- res$event

library(ggplot2)

# Height of lollis represent event durations and their colours
# are mapped to the events' cumulative intensity:
ggplot(mhw, aes(x = date_peak, y = duration)) +
  geom_lolli(aes(colour = intensity_cumulative)) +
  scale_color_distiller(palette = "Spectral", name = "Cumulative \nintensity") +
  xlab("Date") + ylab("Event duration [days]")

# Height of lollis represent event durations and the top three (longest)
# lollis are highlighted in red:
ggplot(mhw, aes(x = date_peak, y = duration)) +
  geom_lolli(n = 3, colour_n = "red") +
  scale_color_distiller(palette = "Spectral") +
  xlab("Peak date") + ylab("Event duration [days]")

# Because this is a proper geom, any number of ill-advised things
# may be done with it:
ggplot(mhw, aes(x = event_no, y = intensity_max)) +
  geom_lolli(shape = 5, aes(colour = rate_onset), linetype = "dotted") +
  scale_color_distiller(palette = "RdYlGn", name = "Rate \nonset") +
  xlab("Event number") + ylab("Max intensity [degree C]")




