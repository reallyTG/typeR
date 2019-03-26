library(spew)


### Name: sample_households
### Title: Sample appropriate indices from household PUMS
### Aliases: sample_households

### ** Examples

data("tartanville")
example_place_id <- tartanville$pop_table$place_id[1] 
example_puma_id <- tartanville$pop_table$puma_id[1] 
example_n_house <- tartanville$pop_table$n_house[1] 
sample_households(method = "uniform", 
                  pums_h = tartanville$pums_h, 
                  pums_p = tartanville$pums_p, 
                  n_house = example_n_house, 
                  place_id = example_place_id, 
                  puma_id = example_puma_id)




