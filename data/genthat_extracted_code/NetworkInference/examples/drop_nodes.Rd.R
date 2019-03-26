library(NetworkInference)


### Name: drop_nodes
### Title: Drop nodes from a cascade object
### Aliases: drop_nodes

### ** Examples


data(policies)
cascades <- as_cascade_long(policies, cascade_node_name = 'statenam', 
                            event_time = 'adopt_year', cascade_id = 'policy')
new_cascades <- drop_nodes(cascades, c("California", "New York"))




