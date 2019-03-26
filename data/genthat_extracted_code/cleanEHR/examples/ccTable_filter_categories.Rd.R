library(cleanEHR)


### Name: ccTable_filter_categories
### Title: Categorical data filter
### Aliases: ccTable_filter_categories

### ** Examples

## Not run: 
##D # Example for categorical filter setup in the YAML configuration
##D NIHR_HIC_ICU_0097:
##D  category:
##D    levels:
##D      A: Alive
##D      D: Dead
##D      E: Alive - not discharged
##D    apply: drop_entry
##D 
##D # Run the filter on ccTable ct
##D ct$filter_categories() # run the filter
##D ct$apply_filters()     # apply the filter and create the clean table
## End(Not run)



