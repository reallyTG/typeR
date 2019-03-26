library(ggetho)


### Name: stat_pop_etho
### Title: Compute and display a population aggregate for a variable of
###   interest
### Aliases: stat_pop_etho

### ** Examples

library(behavr)
metadata <- data.frame(id = sprintf("toy_experiment | %02d", 1:20),
                   age=c(1, 5, 10, 20),
                   condition=c("A", "B"))
dt <- toy_activity_data(metadata, 3)
# We build a plot object
pl <-  ggetho(dt, aes(y = asleep))
# A standard plot of the whole population:
pl + stat_pop_etho()
# We can also split by condition, and display the two population on different facets:
pl + stat_pop_etho() + facet_grid(condition ~ .)

# Instead, we can use different colour for separate conditions:
pl <-  ggetho(dt, aes(y = asleep, colour = condition))
pl + stat_pop_etho()

# Sometimes, we also have numeric condition (e.g. age)
pl <-  ggetho(dt, aes(y = asleep, colour = age))
pl + stat_pop_etho()
# We could want to aggreate several days of data to one circadian day (i.e. time wrapping)
# here, we also plot the invert of moving (!moving)
pl <-  ggetho(dt, aes(y = !moving), time_wrap = hours(24))
pl + stat_pop_etho()



