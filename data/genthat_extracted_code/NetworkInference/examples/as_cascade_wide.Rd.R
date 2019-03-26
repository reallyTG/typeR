library(NetworkInference)


### Name: as_cascade_wide
### Title: Transform wide data to cascade
### Aliases: as_cascade_wide

### ** Examples


data("policies")
cascades <- as_cascade_long(policies, cascade_node_name = 'statenam', 
                            event_time = 'adopt_year', cascade_id = 'policy')
wide_policies = as.matrix(cascades)
cascades <- as_cascade_wide(wide_policies)
is.cascade(cascades)




