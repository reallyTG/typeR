library(spew)


### Name: plot_pop_totals
### Title: Plot characteristic summary output from
###   summarize_top_spew_region as totals
### Aliases: plot_pop_totals

### ** Examples

data(tartanville)

tartanville_syneco <- spew(tartanville$pop_table, tartanville$shapefile, 
                           tartanville$pums_h, tartanville$pums_p)
plot_syneco(tartanville, tartanville_syneco, region_name = "Tartanville")



