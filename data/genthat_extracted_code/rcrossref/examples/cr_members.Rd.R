library(rcrossref)


### Name: cr_members
### Title: Search CrossRef members
### Aliases: cr_members cr_members_

### ** Examples

## Not run: 
##D cr_members(member_ids=98)
##D cr_members(member_ids=340)
##D 
##D cr_members(member_ids=98, works=TRUE)
##D cr_members(member_ids=c(10,98,45,1,9))
##D cr_members(member_ids=c(10,98,45,1,9), works=TRUE)
##D 
##D cr_members(query='hindawi')
##D cr_members(query='ecology')
##D 
##D # facets
##D cr_members(member_ids=98, works=TRUE, facet=TRUE, limit = 0)
##D cr_members(member_ids=98, works=TRUE, facet="license:*", limit = 0)
##D 
##D # curl options
##D cr_members(member_ids=98, verbose = TRUE)
##D 
##D # Use the cursor for deep paging
##D cr_members(member_ids=98, works = TRUE, cursor = "*",
##D    cursor_max = 500, limit = 100)
##D cr_members(member_ids=c(10, 98, 45), works = TRUE, cursor = "*",
##D    cursor_max = 200, limit = 100)
##D 
##D # data not found
##D # cr_members(query="adfdf")
##D # cr_members(member_ids=c(323234343434,3434343434), works=TRUE, facet=TRUE)
##D # cr_members(member_ids=c(323234343434,3434343434,98), works=TRUE,facet=TRUE)
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_members_(query = 'hindawi')
##D cr_members_(member_ids = 98)
##D cr_members_(query = 'hindawi', parse=TRUE)
##D cr_members_(member_ids = 98, works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D cr_members_(member_ids = 98, works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100, parse=TRUE)
##D 
##D # field queries
##D ## query.container-title
##D cr_members(98, works = TRUE, flq = c(`query.container-title` = 'Ecology'))
##D 
##D 
##D # select only certain fields to return
##D res <- cr_members(98, works = TRUE, select = c('DOI', 'title'))
##D names(res$data)
## End(Not run)



