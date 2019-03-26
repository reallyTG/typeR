library(bigrquery)


### Name: list_tabledata
### Title: Retrieve data from a table deprecated
### Aliases: list_tabledata list_tabledata_callback list_tabledata_iter
### Keywords: internal

### ** Examples

## Not run: 
##D billing_project <- "341409650721" # put your project number here
##D natal <- list_tabledata("publicdata", "samples", "natality", max_pages = 2,
##D   page_size = 10)
##D dim(natal)
## End(Not run)



