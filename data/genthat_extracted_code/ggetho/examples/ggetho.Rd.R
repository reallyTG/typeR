library(ggetho)


### Name: ggetho
### Title: Prepare a ggplot object to represent behavioural data
### Aliases: ggetho

### ** Examples

# We start by making a dataset with 20 animals
metadata <- data.table(id = sprintf("toy_experiment|%02d", 1:20),
                   condition = c("A", "B"))
dt <- toy_activity_data(metadata, 3)
# We build a plot object with **nothing inside** (just the axis)
# we want to show proportion of time sleeping  on the y axis:
pl <- ggetho(dt, aes(y = asleep))
pl
# Sometimes, the variable of interest in not on the y axis, but on z axis (colour scale).
# When we do not provide a y axis,
# ggetho will make an ID fo each animal and display them on separate rows
pl <- ggetho(dt, aes(z = asleep))
pl
# this one is the same type, but it groups the animals by condition
pl <- ggetho(dt, aes(z = asleep, y = condition))
pl
# sorting with paste
pl <- ggetho(dt, aes(z = asleep,y = paste(condition, id)))
pl

# we want to summarise (wrap) data along a circadian day:
pl <- ggetho(dt, aes(y = asleep), time_wrap = hours(24))
pl

# double-plotted actogram:
pl <- ggetho(dt,
              aes(z = moving),
              multiplot = 2,
              multiplot_period = hours(24))
pl
# then use `+ stat_tile_etho()` , or `+ stat_bar_tile_etho()`



