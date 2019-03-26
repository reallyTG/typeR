library(mudata2)


### Name: rbind.mudata
### Title: Combine mudata objects
### Aliases: rbind.mudata

### ** Examples

rbind(
  kentvillegreenwood %>% 
    select_params(maxtemp) %>% 
    select_locations(starts_with("KENT")),
  kentvillegreenwood %>% 
    select_params(mintemp) %>% 
    select_locations(starts_with("GREEN"))
)




