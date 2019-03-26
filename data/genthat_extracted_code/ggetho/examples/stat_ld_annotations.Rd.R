library(ggetho)


### Name: stat_ld_annotations
### Title: Compute and display light/dark annotations onto a plot object
### Aliases: stat_ld_annotations

### ** Examples

library(behavr)
# We start by making a to dataset with 20 animals
metadata <- data.frame(id = sprintf("toy_experiment | %02d", 1:20),
                   condition = c("A", "B"))
dt <- toy_activity_data(metadata, 3)
# We build a plot object
pl <-  ggetho(dt, aes(y = asleep)) + stat_pop_etho()
pl + stat_ld_annotations()
# We can also put the annotations in the background:
pl <-  ggetho(dt, aes(y = asleep)) +
                 stat_ld_annotations(outline = NA) +
                 stat_pop_etho()
pl
# Different colours (e.g. DD)
pl + stat_ld_annotations(ld_colour = c("grey", "black"))
# Shorter period
pl + stat_ld_annotations(period = hours(22), phase = hours(3))
# On a tile plot:
pl <-  ggetho(dt, aes(z = asleep)) + stat_tile_etho()
pl + stat_ld_annotations()



