library(patentsview)


### Name: search_pv
### Title: Search PatentsView
### Aliases: search_pv

### ** Examples


## Not run: 
##D 
##D search_pv(query = '{"_gt":{"patent_year":2010}}')
##D 
##D search_pv(
##D   query = qry_funs$gt(patent_year = 2010),
##D   fields = get_fields("patents", c("patents", "assignees"))
##D )
##D 
##D search_pv(
##D   query = qry_funs$gt(patent_year = 2010),
##D   method = "POST",
##D   fields = "patent_number",
##D   sort = c("patent_number" = "asc")
##D )
##D 
##D search_pv(
##D   query = qry_funs$eq(inventor_last_name = "crew"),
##D   all_pages = TRUE
##D )
##D 
##D search_pv(
##D   query = qry_funs$contains(inventor_last_name = "smith"),
##D   endpoint = "assignees"
##D )
##D 
##D search_pv(
##D   query = qry_funs$contains(inventor_last_name = "smith"),
##D   config = httr::timeout(40)
##D )
## End(Not run)




