library(solrium)


### Name: collection_overseerstatus
### Title: Get overseer status
### Aliases: collection_overseerstatus

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D conn$collection_overseerstatus()
##D res <- conn$collection_overseerstatus()
##D res$responseHeader
##D res$leader
##D res$overseer_queue_size
##D res$overseer_work_queue_size
##D res$overseer_operations
##D res$collection_operations
##D res$overseer_queue
##D res$overseer_internal_queue
##D res$collection_queue
## End(Not run)



