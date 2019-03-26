library(ggetho)


### Name: time_scales
### Title: Scales for durations
### Aliases: time_scales scale_x_days scale_y_days scale_x_hours
###   scale_y_hours scale_x_seconds scale_y_seconds

### ** Examples

# We generate some data
metadata <- data.frame(id = sprintf("toy_experiment | %02d", 1:20),
                   condition = c("A","B"))
dt <- toy_activity_data(metadata, 3)
# Then, a simple plot
pl <-  ggetho(dt, aes(y = asleep)) + stat_pop_etho()
pl + scale_x_hours(breaks = days(c(1, 2)))
pl + scale_x_hours()
pl + scale_x_days(breaks = days(c(1, 2)))
pl + scale_x_days()

# To express time modulus `time_wrap`
# e.g. time n the day
pl + scale_x_hours(time_wrap = hours(24)) +
     coord_cartesian(xlim=c(0, days(2)))

# On a shorter time scale
pl <-  ggetho(dt[t < hours(5)], aes(z = asleep)) + stat_tile_etho()
pl + scale_x_hours()
pl + scale_x_hours(breaks = hours(1:4))
pl + scale_x_seconds(breaks = hours(1:4))



