library(NetworkInference)


### Name: subset_cascade
### Title: Select a subset of cascades from cascade object
### Aliases: subset_cascade

### ** Examples


data(policies)
cascades <- as_cascade_long(policies, cascade_node_name = 'statenam', 
                            event_time = 'adopt_year', cascade_id = 'policy')
cascade_names <- names(cascades$cascade_times)
subset_cascade(cascades, selection = cascade_names[1:10])




