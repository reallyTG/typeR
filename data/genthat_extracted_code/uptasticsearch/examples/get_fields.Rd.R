library(uptasticsearch)


### Name: get_fields
### Title: Get the names and data types of the indexed fields in an index
### Aliases: get_fields

### ** Examples

## Not run: 
##D # get the mapping for all indexed fields in the ticket_sales and customers indices
##D mappingDT <- get_fields(es_host = "http://es.custdb.mycompany.com:9200"
##D                               , es_indices = c("ticket_sales", "customers"))
## End(Not run)



