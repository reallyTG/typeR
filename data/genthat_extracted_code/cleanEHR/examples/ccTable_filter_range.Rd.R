library(cleanEHR)


### Name: ccTable_filter_range
### Title: Numerical range filter
### Aliases: ccTable_filter_range

### ** Examples

## Not run: 
##D # YAML example
##D NIHR_HIC_ICU_0108:
##D    shortName: h_rate
##D    dataItem: Heart rate
##D    range:
##D     labels:
##D      red: (0, 300)     # broader
##D      amber: (11, 170) 
##D      green: (60, 100)  # narrower
##D     apply: drop_entry
##D # apply range filter on ccTable ct
##D ct$filter_range("yellow")
##D ct$apply_filters
## End(Not run)



