library(tsibble)


### Name: tourism
### Title: Australian domestic overnight trips
### Aliases: tourism
### Keywords: datasets

### ** Examples

data(tourism)
# Total trips over geographical regions
tourism %>% 
  group_by(Region, State) %>% 
  summarise(Total_Trips = sum(Trips))



