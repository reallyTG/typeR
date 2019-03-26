library(rcrossref)


### Name: cr_prefixes
### Title: Search CrossRef prefixes
### Aliases: cr_prefixes cr_prefixes_

### ** Examples

## Not run: 
##D cr_prefixes(prefixes="10.1016")
##D cr_prefixes(prefixes="10.1016", works=TRUE)
##D cr_prefixes(prefixes=c('10.1016','10.1371','10.1023','10.4176','10.1093'))
##D cr_prefixes(prefixes=c('10.1016','10.1371'), works=TRUE)
##D cr_prefixes(prefixes="10.1016", works=TRUE, filter=c(has_full_text=TRUE), 
##D   limit=5)
##D cr_prefixes(prefixes="10.1016", works=TRUE, query='ecology', limit=4)
##D cr_prefixes(prefixes="10.1016", works=TRUE, query='ecology', limit=4)
##D 
##D # facets - only avail. when works=TRUE
##D cr_prefixes(prefixes="10.1016", works=TRUE, facet=TRUE)
##D cr_prefixes(prefixes="10.1016", works=TRUE, facet="license:*", limit=0)
##D cr_prefixes(prefixes=c('10.1016','10.1371'), works=TRUE, facet=TRUE,
##D   limit=0)
##D 
##D # Use the cursor for deep paging
##D cr_prefixes("10.1016", works = TRUE, cursor = "*", cursor_max = 500,
##D    limit = 100)
##D cr_prefixes(c('10.1016', '10.1371'), works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_prefixes_("10.1016")
##D cr_prefixes_(c('10.1016', '10.1371'))
##D cr_prefixes_("10.1016", works = TRUE, query = 'ecology', limit = 10)
##D cr_prefixes_("10.1016", works = TRUE, query = 'ecology', parse=TRUE,
##D    limit = 10)
##D cr_prefixes_("10.1016", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D cr_prefixes_("10.1016", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100, parse = TRUE)
##D 
##D # field queries
##D ## query.container-title
##D cr_prefixes("10.1016", works = TRUE,
##D   flq = c(`query.container-title` = 'Ecology'))
##D 
##D # select only certain fields to return
##D res <- cr_prefixes("10.1016", works = TRUE, select = c('DOI', 'title'))
##D names(res$data)
## End(Not run)



