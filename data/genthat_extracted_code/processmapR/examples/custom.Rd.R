library(processmapR)


### Name: custom
### Title: Custom map profile
### Aliases: custom

### ** Examples

## Not run: 
##D library(eventdataR)
##D library(processmapR)
##D data(traffic_fines)
##D # make sure the amount attribute is propagated forward in each trace
##D # using zoo::na.locf instead of tidyr::fill since it is much faster
##D # still the whole pre-processing is still very slow
##D library(zoo)
##D 
##D traffic_fines_prepared <- traffic_fines %>%
##D filter_trace_frequency(percentage = 0.8) %>%
##D group_by_case() %>%
##D mutate(amount = na.locf(amount, na.rm = F)) %>%
##D ungroup_eventlog()
##D 
##D process_map(traffic_fines_prepared, type_nodes = custom(attribute = "amount", units = "EUR"))
## End(Not run)




