library(httk)


### Name: calc_stats
### Title: Calculate the statistics.
### Aliases: calc_stats
### Keywords: Solve Statistics

### ** Examples

calc_stats(chem.name='Bisphenol-A',days=100,stats='mean',model='3compartment')
calc_stats(chem.name='Bisphenol-A',days=100,stats=c('peak','mean'),species='Rat')
## Not run: 
##D all.peak.stats <- calc_stats(days=10, doses.per.day = 3, stats = "peak")
## End(Not run)
triclosan.stats <- calc_stats(days=10, chem.name = "triclosan")



