library(elastic)


### Name: cluster
### Title: Elasticsearch cluster endpoints
### Aliases: cluster cluster_settings cluster_health cluster_state
###   cluster_stats cluster_reroute cluster_pending_tasks

### ** Examples

## Not run: 
##D cluster_settings()
##D cluster_health()
##D 
##D cluster_state()
##D cluster_state(metrics = "version")
##D cluster_state(metrics = "nodes")
##D cluster_state(metrics = c("version", "nodes"))
##D cluster_state(metrics = c("version", "nodes", 'blocks'))
##D cluster_state("shakespeare", metrics = "metadata")
##D cluster_state(c("shakespeare", "flights"), metrics = "metadata")
##D 
##D cluster_stats()
##D cluster_pending_tasks()
##D 
##D body <- '{
##D   "commands" : [ {
##D     "move" :
##D       {
##D         "index" : "test", "shard" : 0,
##D         "from_node" : "node1", "to_node" : "node2"
##D       }
##D     },
##D     {
##D       "allocate" : {
##D           "index" : "test", "shard" : 1, "node" : "node3"
##D       }
##D     }
##D   ]
##D }'
##D # cluster_reroute(body =  body)
##D 
##D cluster_health()
##D # cluster_health(wait_for_status = "yellow", timeout = "3s")
## End(Not run)



