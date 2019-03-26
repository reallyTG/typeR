library(autovarCore)


### Name: autovarCore-package
### Title: Automated Vector Autoregression Models and Networks
### Aliases: autovarCore-package autovarCore
### Keywords: regression ts multivariate package

### ** Examples

## Not run: 
##D # AutovarCore requires input data in data.frame format.
##D # If you have data in a .csv, .dta, or .sav file, use
##D # the 'foreign' library to load this data into R first.
##D # (You may need to type:
##D #    install.packages('foreign')
##D #  if you do not have the foreign library installed on
##D #  your system.)
##D 
##D # This example data set can be downloaded from
##D # https://autovar.nl/datasets/aug_pp5_da.sav
##D suppressWarnings(dfile <- foreign::read.spss('~/Downloads/aug_pp5_da.sav'))
##D dframe <- data.frame(Activity = dfile$Activity, Depression = dfile$Depression)
##D 
##D # Call autovar with the given data frame. Type:
##D #   ?autovar
##D # (after having typed "library('autovarCore')") to see
##D # which other options are available.
##D models_found <- autovar(dframe, selected_column_names = c('Activity', 'Depression'))
##D 
##D # Show details for the best model found
##D print(models_found[[1]])
## End(Not run)



