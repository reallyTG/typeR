library(kntnr)


### Name: kntn_record
### Title: 'kintone' Record API
### Aliases: kntn_record kntn_record kntn_records

### ** Examples

## Not run: 
##D kntn_set_auth()
##D 
##D app <- 10
##D 
##D # get a single record
##D d <- kntn_record(app, id = 1)
##D 
##D # get records up to 1000 (default)
##D d <- kntn_records(app)
##D 
##D # get records up to 5000 records at the latency of 500 records/request.
##D d <- kntn_records(app, max_records = 5000, records_per_request = 500L)
##D 
##D # get records as list
##D d <- kntn_records(app, as = "list")
##D 
##D # get records matched with the specified query and fields.
##D # See https://developer.kintone.io/hc/en-us/articles/213149287/ for the query syntax
##D d <- kntn_records(app, fields = c("timestamp", "value"),
##D                   query = "updated_time > \"2016-10-03T09:00:00+0900\"")
##D 
##D # Some types like SUBTABLE are converted as nested data.frame.
##D # You can unnest them by using kntn_unnest.
##D kntn_unnest(d)
## End(Not run)




