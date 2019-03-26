library(oai)


### Name: list_records
### Title: List records
### Aliases: list_records

### ** Examples

## Not run: 
##D # By default you get back a single data.frame
##D list_records(from = '2011-05-01T', until = '2011-08-15T')
##D list_records(from = '2011-05-01T', until = '2011-07-15T')
##D list_records(from = '2011-06-01T', until = '2011-07-01T')
##D 
##D # Get a list
##D list_records(from = '2011-06-01T', until = '2011-07-01T', as = "list")
##D 
##D # Get raw text
##D list_records(from = '2011-06-01T', until = '2011-07-01T', as = "raw")
##D list_records(from = '2011-06-01T', until = '2011-07-30T', as = "raw")
##D 
##D # Use a resumption token
##D # list_records(token =
##D #  "1443799900201,2015-09-01T00:00:00Z,2015-10-01T23:59:59Z,50,null,oai_dc")
## End(Not run)



