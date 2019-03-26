library(spew)


### Name: sample_locations
### Title: Generic sampling locations function
### Aliases: sample_locations

### ** Examples

data("tartanville")
example_place_id <- tartanville$pop_table$place_id[1] 
example_puma_id <- tartanville$pop_table$puma_id[1] 
example_n_house <- tartanville$pop_table$n_house[1] 
sample_locations(method = "uniform", 
                  shapefile = tartanville$shapefile, 
                  n_house = example_n_house, 
                  place_id = example_place_id)
                  



