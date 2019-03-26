library(salesforcer)


### Name: sf_list_metadata
### Title: List All Objects of a Certain Metadata Type in Salesforce
### Aliases: sf_list_metadata

### ** Examples

## Not run: 
##D # pull back a list of all Custom Objects and Email Templates
##D my_queries <- list(list(type='CustomObject'),
##D                    list(folder='unfiled$public',
##D                         type='EmailTemplate'))
##D metadata_info <- sf_list_metadata(queries=my_queries)
## End(Not run)



