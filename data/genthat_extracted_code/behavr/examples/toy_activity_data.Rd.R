library(behavr)


### Name: toy_activity_data
### Title: Generate toy activity and sleep data mimicking Drosophila
###   behaviour in tubes
### Aliases: toy_activity_data toy_ethoscope_data toy_dam_data

### ** Examples

# just one animal, no metadata needed
dt <- toy_ethoscope_data(duration = days(1))

# advanced, using a metadata
metadata <- data.frame(id = paste0("toy_experiment|",1:9),
                   condition = c("A", "B", "C"))

metadata
# Data that could come from the scopr package:
dt <- toy_ethoscope_data(metadata, duration = days(1))
print(dt)

# Some DAM-like data
dt <- toy_dam_data(metadata, seed = 2, duration = days(1))
print(dt)

# data where behaviour is annotated e.g. by a classifier
dt <- toy_activity_data(metadata, 1.5)
print(dt)



