library(rscorecard)


### Name: sc_filter
### Title: Filter scorecard data by variable values.
### Aliases: sc_filter sc_filter_

### ** Examples

## Not run: 
##D sc_filter(region == 1) # New England institutions
##D sc_filter(stabbr == c('TN','KY')) # institutions in Tennessee and Kentucky
##D sc_filter(control != 3) # exclude private, for-profit institutions
##D sc_filter(control == c(1,2)) # same as above
##D sc_filter(control == 1:2) # same as above
##D sc_filter(stabbr == 'TN', control == 1, locale == 41:43) # TN rural publics
## End(Not run)
## Not run: 
##D sc_filter_('region == 1')
##D sc_filter_('control != 3')
##D 
##D ## With internal strings, you must either use both double and single quotes
##D ## or escape internal quotes
##D sc_filter_("stabbr == c('TN','KY')")
##D sc_filter_('stabbr == c(\'TN\',\'KY\')')
##D 
##D ## stored in object
##D filters <- c('control == 1', 'locale == 41:43')
##D sc_filter_(filters)
## End(Not run)



