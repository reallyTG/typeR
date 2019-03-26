library(RSiteCatalyst)


### Name: GetElements
### Title: Get Valid Elements for a Report Suite
### Aliases: GetElements

### ** Examples

## Not run: 
##D elements.valid <- GetElements("your_report_suite",
##D                               metrics=c('visitors','pageviews'),
##D                               elements=c('page','geoCountry'),
##D                               date.granularity='day',
##D                               report.type='')
##D 
##D elements <- GetElements(c("your_prod_report_suite","your_dev_report_suite"))
## End(Not run)



