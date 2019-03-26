library(pangaear)


### Name: pg_list_records
### Title: List records from Pangaea
### Aliases: pg_list_records

### ** Examples

## Not run: 
##D pg_list_records(set='citable', from=Sys.Date()-1, until=Sys.Date())
##D 
##D # When no results found > "'noRecordsMatch'"
##D # pg_list_records(set='geomound', from='2015-01-01', until='2015-01-01')
##D 
##D pg_list_records(prefix="iso19139", set='citable', from=Sys.Date()-1,
##D   until=Sys.Date())
##D 
##D ## FIXME - below are broken
##D # pg_list_records(prefix="dif", set='citable', from=Sys.Date()-4,
##D #   until=Sys.Date())
##D # pg_list_records(prefix="dif", set='project4094', from=Sys.Date()-4,
##D #   until=Sys.Date())
## End(Not run)



