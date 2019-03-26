library(SWMPr)


### Name: ecometab
### Title: Ecosystem metabolism
### Aliases: ecometab ecometab.swmpr ecometab.default

### ** Examples

## Not run: 
##D ## import water quality and weather data, qaqc
##D data(apadbwq)
##D data(apaebmet)
##D wq <- qaqc(apadbwq)
##D met <- qaqc(apaebmet)
##D 
##D ## combine
##D dat <- comb(wq, met)
##D 
##D ## output units in grams of oxygen
##D res <- ecometab(dat, metab_units = 'grams')
##D attr(res, 'metabolism')
##D 
##D ## manual input of integration depth
##D ## NA values must be filled
##D dat_fill <- na.approx(dat, params = 'depth', maxgap = 1e6)
##D depth <- dat_fill$depth
##D res <- ecometab(dat, metab_units = 'grams', depth_val = depth)
##D attr(res, 'metabolism')
##D 
##D ## use the default method for ecometab with a generic data frame
##D ## first recreate a generic object from the sample data
##D cols <- c('datetimestamp', 'do_mgl', 'depth', 'atemp', 'sal', 'temp', 'wspd', 'bp')
##D dat <- data.frame(dat)
##D dat <- dat[, cols]
##D res <- ecometab(dat, tz = 'America/Jamaica', lat = 29.67, long = -85.06)
##D res
## End(Not run)



