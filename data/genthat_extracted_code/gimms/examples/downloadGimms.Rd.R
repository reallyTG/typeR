library(gimms)


### Name: downloadGimms
### Title: Download GIMMS NDVI3g Data
### Aliases: downloadGimms downloadGimms,Date-method
###   downloadGimms,numeric-method downloadGimms,character-method
###   downloadGimms,missing-method

### ** Examples

## Not run: 
##D tmp <- tempdir()
##D 
##D ## 'Date' method
##D gimms_files_date <- downloadGimms(x = as.Date("2000-01-01"),
##D                                   y = as.Date("2000-12-31"),
##D                                   dsn = tmp)
##D 
##D ## 'numeric' method (i.e., particular years)
##D gimms_files_year <- downloadGimms(x = 2000,
##D                                   y = 2002,
##D                                   dsn = tmp)
##D 
##D ## 'character' method (i.e., particular files)
##D ecocast <- system.file("extdata", "inventory_ecv1.rds", package = "gimms")
##D gimms_files_char <- readRDS(ecocast)
##D gimms_files_char <- downloadGimms(x = gimms_files_char[1:6],
##D                                   dsn = tmp)
##D 
##D ## 'missing' method (i.e., entire collection)
##D gimms_files_full <- downloadGimms(dsn = tmp)
## End(Not run)




