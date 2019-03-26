library(spew)


### Name: plot_syneco
### Title: Plot Synthetic Ecosystem
### Aliases: plot_syneco

### ** Examples

data(tartanville)

tartanville_syneco <- spew(tartanville$pop_table, tartanville$shapefile, 
                           tartanville$pums_h, tartanville$pums_p)
                           
plot_syneco(tartanville, tartanville_syneco, region_name = "Tartanville")




