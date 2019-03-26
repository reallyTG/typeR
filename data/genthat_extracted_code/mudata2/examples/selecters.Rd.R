library(mudata2)


### Name: select_datasets
### Title: Subset a mudata object by identifier
### Aliases: select_datasets select_datasets.default select_locations
###   select_locations.default select_params select_params.default

### ** Examples

# renaming can be handy when locations are verbosely named
ns_climate %>% 
  select_locations(sable_island = starts_with("SABLE"),
                   nappan = starts_with("NAPPAN"), 
                   baddeck = starts_with("BADDECK")) %>% 
  select_params(ends_with("temp"))
  
# can also use quoted values
long_lake %>%
  select_params("Pb", "As", "Cr")

# can also use negative values to remove params/datasets/locations
long_lake %>%
  select_params(-Pb)
  
# to get around non-standard evaluation, use one_of()
my_params <- c("Pb", "As", "Cr")
long_lake %>%
  select_params(one_of(my_params))




