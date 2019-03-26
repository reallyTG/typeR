library(ggetho)


### Name: id_labeller
### Title: A facet labeller for 'id'
### Aliases: id_labeller

### ** Examples

library(behavr)
metadata <- data.frame(
     id = sprintf("2017-09-01 20:00:12|toy_experiment_a_very_long_name|%02d", 1:20),
     condition = c("A", "B"))
dt <- toy_activity_data(metadata, duration = hours(2))
pl <- ggetho(dt, aes(y = asleep)) + stat_pop_etho()
## Without labelling
pl + facet_wrap( ~ id)

## With labeller
pl + facet_wrap( ~ id, labeller = id_labeller)




