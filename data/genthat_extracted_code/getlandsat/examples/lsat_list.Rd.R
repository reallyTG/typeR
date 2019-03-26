library(getlandsat)


### Name: lsat_list
### Title: List Landsat images
### Aliases: lsat_list

### ** Examples

## Not run: 
##D lsat_list(max = 10)
##D 
##D # paging, start a specific key string
##D res <- lsat_list(max = 10)
##D lsat_list(marker = res$Key[10], max = 10)
##D 
##D # curl options
##D lsat_list(max = 3, verbose = TRUE)
## End(Not run)



