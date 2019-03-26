library(pangaear)


### Name: pg_list_identifiers
### Title: List identifiers of the Pangaea repository
### Aliases: pg_list_identifiers

### ** Examples

## Not run: 
##D pg_list_identifiers(
##D   from = paste0(Sys.Date() - 2, "T00:00:00Z"),
##D   until = paste0(Sys.Date() - 1, "T18:00:00Z")
##D )
##D pg_list_identifiers(set="geocode1", from=Sys.Date()-1, until=Sys.Date())
##D pg_list_identifiers(prefix="iso19139", from=Sys.Date()-1, until=Sys.Date())
##D pg_list_identifiers(prefix="dif",
##D   from = paste0(Sys.Date() - 2, "T00:00:00Z"),
##D   until = paste0(Sys.Date() - 1, "T18:00:00Z")
##D )
## End(Not run)



