library(countyfloods)


### Name: get_flow_data
### Title: Retrieve discharge data at specified gages
### Aliases: get_flow_data

### ** Examples

## Not run: 
##D miami_gages <- get_gages("12086", start_date = "2000-01-01",
##D                             end_date = "2009-12-31")
##D miami_flow_data <- get_flow_data(gages_df = miami_gages,
##D                                  start_date = "2000-01-01",
##D                                  end_date = "2000-01-31")
##D # Example using piping
##D library(dplyr)
##D miami_flow_data <- get_gages("12086", start_date = "2000-01-01",
##D                                 end_date = "2009-12-31") %>%
##D                    get_flow_data(start_date = "2000-01-01",
##D                                  end_date = "2000-01-31")
## End(Not run)



