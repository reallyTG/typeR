library(sugrrants)


### Name: geom_acf
### Title: Autocorrelation for temporal data
### Aliases: geom_acf GeomAcf
### Keywords: datasets

### ** Examples

library(dplyr)
fstaff <- pedestrian %>%
  filter(Sensor_ID == 13)

# use ggplot2 
fstaff %>%
  ggplot(aes(x = ..lag.., y = Hourly_Counts)) +
  geom_acf()




