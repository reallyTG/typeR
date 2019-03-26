library(SWMPrExtension)


### Name: seasonal_barplot
### Title: Cumulative Bar Plot
### Aliases: seasonal_barplot seasonal_barplot.swmpr

### ** Examples

data(apaebmet)
dat <- qaqc(apaebmet, qaqc_keep = c('0', '3', '5'))

x <- seasonal_barplot(dat, param = 'totprcp'
                      , season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12))
                      , season_names = c('Winter', 'Spring', 'Summer', 'Fall')
                      , hist_avg = TRUE
                      , converted = FALSE)

## Not run: 
##D # return a table instead of a figure
##D y <- seasonal_barplot(dat, param = 'totprcp'
##D                       , season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12))
##D                       , season_names = c('Winter', 'Spring', 'Summer', 'Fall')
##D                       , converted = F
##D                       , plot = F)
##D 
##D ## divide plot into seasonal facets
##D x <- seasonal_barplot(dat, param = 'totprcp'
##D                       , season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12))
##D                       , season_names = c('Winter', 'Spring', 'Summer', 'Fall')
##D                       , season_facet = T
##D                       , hist_avg = T
##D                       , converted = F)
##D 
##D ## convert from mm to in
##D dat$totprcp <- dat$totprcp / 25.4
##D 
##D x <- seasonal_barplot(dat, param = 'totprcp'
##D                       , season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12))
##D                       , season_names = c('Winter', 'Spring', 'Summer', 'Fall')
##D                       , hist_avg = T
##D                       , converted
##D                        = T)
## End(Not run)



