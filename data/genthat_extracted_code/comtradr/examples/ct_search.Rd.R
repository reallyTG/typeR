library(comtradr)


### Name: ct_search
### Title: Get UN Comtrade data
### Aliases: ct_search

### ** Examples

## Not run: 
##D ## Example API call number 1:
##D # All exports from China to South Korea, United States and Mexico over all
##D # years.
##D ex_1 <- ct_search(reporters = "China",
##D                   partners = c("Rep. of Korea", "USA", "Mexico"),
##D                   trade_direction = "exports")
##D nrow(ex_1)
##D 
##D ## Example API call number 2:
##D # All shipments related to shrimp between Canada and all other countries,
##D # between 2011 and 2015.
##D # Perform "shrimp" query
##D shrimp_codes <- ct_commodity_lookup("shrimp",
##D                                     return_code = TRUE,
##D                                     return_char = TRUE)
##D 
##D # Make API call
##D ex_2 <- ct_search(reporters = "Canada",
##D                   partners = "All",
##D                   trade_direction = "all",
##D                   start_date = 2011,
##D                   end_date = 2015,
##D                   commod_codes = shrimp_codes)
##D nrow(ex_2)
##D 
##D # Access metadata
##D attributes(ex_2)$url
##D attributes(ex_2)$time_stamp
##D attributes(ex_2)$req_duration
## End(Not run)



