library(ohtadstats)


### Name: dwrapper
### Title: Ohta D Statistic Wrapper
### Aliases: dwrapper

### ** Examples


data(beissinger_data)
beissinger_subset <- beissinger_data[,1:15]
dwrapper(beissinger_subset, tot_maf = 0.05, pop_maf = 0.01)

## Not run: 
##D data(beissinger_data)
##D dwrapper(beissinger_data, tot_maf = 0.05, pop_maf = 0.01)
## End(Not run)



