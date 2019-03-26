library(tsibble)


### Name: pedestrian
### Title: Pedestrian counts in the city of Melbourne
### Aliases: pedestrian
### Keywords: datasets

### ** Examples

data(pedestrian)
# make implicit missingness to be explicit ----
pedestrian %>% fill_gaps()
# compute daily maximum counts across sensors ----
pedestrian %>% 
  group_by(Sensor) %>% 
  index_by(Date) %>% # group by Date and use it as new index
  summarise(MaxC = max(Count))



