library(spew)


### Name: summarize_spew_out
### Title: Summarize spew output
### Aliases: summarize_spew_out

### ** Examples

data(tartanville)

tartanville_syneco <- spew(tartanville$pop_table, tartanville$shapefile, 
                           tartanville$pums_h, tartanville$pums_p)
                           
out <-  summarize_spew_out(tartanville_syneco, 
                           vars_to_sum_h = c("puma_id"), 
                           vars_to_sum_p = c("SEX"), 
                           vars_to_sum_env = NULL, 
                           top_region_id = "Tartanville") 
print(out)




