library(sugrrants)


### Name: stat_acf
### Title: Autocorrelation for temporal data
### Aliases: stat_acf

### ** Examples

library(dplyr)
fstaff <- pedestrian %>%
  filter(Sensor_ID == 13)

# use ggplot2 
fstaff %>%
  ggplot(aes(x = ..lag.., y = Hourly_Counts)) +
  stat_acf(geom = "bar")




