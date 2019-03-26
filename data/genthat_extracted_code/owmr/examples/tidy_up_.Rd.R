library(owmr)


### Name: tidy_up_
### Title: Tidy up owm data. (DEPRECATED)
### Aliases: tidy_up_

### ** Examples

## Not run: 
##D    result <- find_city("Malaga")
##D    result$list %>% tidy_up_()
##D 
##D    # keep dots in column names
##D    result$list %>% tidy_up_(use_underscore_ = FALSE)
##D 
##D    # keep all prefices
##D    result$list %>% tidy_up_(remove_prefix_ = NULL)
## End(Not run)



