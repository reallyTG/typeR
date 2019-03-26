library(SWMPr)


### Name: plot_metab
### Title: Plot ecosystem metabolism for a swmpr object
### Aliases: plot_metab plot_metab.swmpr

### ** Examples

## Not run: 
##D ## import water quality and weather data
##D data(apadbwq)
##D data(apaebmet)
##D 
##D ## qaqc, combine
##D wq <- qaqc(apadbwq)
##D met <- qaqc(apaebmet)
##D dat <- comb(wq, met)
##D 
##D ## estimate metabolism
##D res <- ecometab(dat)
##D 
##D ## plot
##D plot_metab(res)
##D 
##D ## change alpha, aggregation period, widths
##D plot_metab(res, by = 'quarters', alpha = 0.1, widths = 0)
##D 
##D ## plot daily raw, no aesthetics
##D plot_metab(res, by = 'days', pretty = FALSE)
##D 
##D ## note the difference if aggregating with a moving window average
##D plot_metab(res, by = 30)
## End(Not run)



