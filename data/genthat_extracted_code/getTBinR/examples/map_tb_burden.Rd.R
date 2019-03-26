library(getTBinR)


### Name: map_tb_burden
### Title: Map TB Burden
### Aliases: map_tb_burden

### ** Examples


## Map raw incidence rates
map_tb_burden()
## Not run: 
##D #' ## Map raw incidence rates
##D map_tb_burden(year = 2014:2017, facet = "year")
##D 
##D ## Map log10 scaled incidence rates
##D map_tb_burden(trans = "log10")
##D 
##D ## Map percentage annual change in incidence rates
##D map_tb_burden(annual_change = TRUE)
##D 
##D ## Find variables relating to mortality in the WHO dataset
##D search_data_dict(def = "mortality")
##D 
##D ## Map mortality rates (exc HIV) - without progress messages
##D map_tb_burden(metric = "e_mort_exc_tbhiv_100k", verbose = FALSE)
##D 
##D ## Can also use a discrete metric if one is available
##D map_tb_burden(metric = "g_whoregion", metric_label = "WHO world region")
## End(Not run)



