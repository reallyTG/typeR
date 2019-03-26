library(uptasticsearch)


### Name: get_counts
### Title: Examine the distribution of distinct values for a field in
###   Elasticsearch
### Aliases: get_counts

### ** Examples

## Not run: 
##D # Count number of customers by payment method
##D recoDT <- get_counts(field = "pmt_method"
##D                      , es_host = "http://es.custdb.mycompany.com:9200"
##D                      , es_index = "ticket_sales"
##D                      , start_date = "now-2w"
##D                      , end_date = "now"
##D                      , time_field = "dateTime")
## End(Not run)



