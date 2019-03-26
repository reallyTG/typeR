library(taxizedb)


### Name: sql_collect
### Title: Query and get data back into a data.frame
### Aliases: sql_collect

### ** Examples

## Not run: 
##D src <- src_itis()
##D sql_collect(src, "select * from hierarchy limit 5")
##D ## or pipe the src to sql_collect
##D src %>% sql_collect("select * from hierarchy limit 5")
## End(Not run)



