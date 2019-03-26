library(ggetho)


### Name: ggspectro
### Title: Prepare a ggplot object to represent spectrogram data
### Aliases: ggspectro

### ** Examples

## No test: 
library(zeitgebr)
data(dams_sample)
dt <- dams_sample
spect_dt <- spectrogram(activity, dt)
pl <- ggspectro(spect_dt,time_wrap = hours(24)) + stat_tile_etho() + scale_y_hours(log=T) +
  stat_ld_annotations(ld_colours = c("grey","black"))
pl + facet_grid(period_group ~ .)
pl + facet_wrap(~ id)
## End(No test)



