library(ggetho)


### Name: stat_bar_tile_etho
### Title: Display a variable of interest either as a colour intensity
###   value or as a bar height
### Aliases: stat_bar_tile_etho stat_tile_etho

### ** Examples

# We start by making a to dataset with 20 animals
metadata <- data.frame(id = sprintf("toy_experiment | %02d", 1:20),
                   age = c(1, 5, 10, 20),
                   condition = c("A", "B"))
print(metadata)
dt <- toy_activity_data(metadata, 3)
# We build a plot object
pl <-  ggetho(dt, aes(z = asleep))
# A standard plot one row per animal:
pl + stat_tile_etho()
# We can also group animals per condition and calculate the average sleep
pl <-  ggetho(dt, aes(z = asleep, y = condition))
pl + stat_tile_etho()

# We can sort by adding condition AND id on the y axis:
pl <-  ggetho(dt, aes(z = asleep, y = interaction(id, condition)))
pl + stat_tile_etho()
# Same if we want to sort by age
pl <-  ggetho(dt, aes(z = asleep, y = interaction(id, age)))
pl + stat_tile_etho()

# Instead, of the average, maybe we want to show the highest (max)
# posible value of sleep for any time point
pl + stat_tile_etho(method = max)
# We can also use stat_bar_tile as an alternative
pl + stat_bar_tile_etho()



