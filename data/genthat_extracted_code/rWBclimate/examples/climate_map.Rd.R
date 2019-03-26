library(rWBclimate)


### Name: climate_map
### Title: Map climate data
### Aliases: climate_map

### ** Examples

## Not run: 
##D #Set the kmlpath option
##D options(kmlpath = "/Users/edmundhart/kmltemp")
##D ##Here we use a list basins for Africa
##D af_basin <- create_map_df(Africa_basin)
##D af_basin_dat <- get_ensemble_temp(Africa_basin,"annualanom",2080,2100)
##D ##  Subset data to just one scenario, and one percentile
##D af_basin_dat <- subset(af_basin_dat,af_basin_dat$scenario == "a2")
##D af_basin_dat <- subset(af_basin_dat,af_basin_dat$percentile == 50)
##D af_map <- climate_map(af_basin,af_basin_dat,return_map = T)
##D af_map + scale_fill_continuous("Temperature \n anomaly",low="yellow",high = "red") + theme_bw()
##D 
## End(Not run)



