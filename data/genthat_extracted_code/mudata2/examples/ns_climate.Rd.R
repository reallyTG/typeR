library(mudata2)


### Name: ns_climate
### Title: Nova Scotia Long-Term Climate Data
### Aliases: ns_climate
### Keywords: datasets

### ** Examples

print(ns_climate)
autoplot(ns_climate) # quite a messy plot, lots of data

# a more focused plot comparing three locations
library(lubridate)
ns_climate %>% 
  select_locations(sable_island = starts_with("SABLE"),
                   nappan = starts_with("NAPPAN"), 
                   baddeck = starts_with("BADDECK")) %>% 
  select_params(ends_with("temp")) %>%
  filter_data(month(date) == 6) %>% 
  autoplot()




