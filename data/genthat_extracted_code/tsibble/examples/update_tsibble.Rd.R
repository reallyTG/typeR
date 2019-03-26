library(tsibble)


### Name: update_tsibble
### Title: Update key and index for a tsibble
### Aliases: update_tsibble

### ** Examples

pedestrian %>% 
  group_by_key() %>% 
  mutate(Hour_Since = Date_Time - min(Date_Time)) %>% 
  update_tsibble(index = Hour_Since)



