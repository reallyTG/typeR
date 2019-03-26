library(rcrossref)


### Name: cr_funders
### Title: Search the CrossRef Fundref API
### Aliases: cr_funders cr_funders_

### ** Examples

## Not run: 
##D cr_funders(query="NSF", limit=1)
##D cr_funders(query="NSF")
##D cr_funders(dois='10.13039/100000001')
##D out <- cr_funders(dois=c('10.13039/100000001','10.13039/100000015'))
##D out['10.13039/100000001']
##D out[['10.13039/100000001']]
##D 
##D cr_funders(dois='10.13039/100000001')
##D cr_funders(dois='10.13039/100000001', works=TRUE, limit=5)
##D 
##D cr_funders(dois=c('10.13039/100000001','10.13039/100000015'))
##D cr_funders(dois=c('10.13039/100000001','10.13039/100000015'), works=TRUE)
##D 
##D ## get facets back
##D cr_funders("10.13039/100000001", works=TRUE, facet=TRUE, limit = 0)
##D cr_funders("10.13039/100000001", works=TRUE, facet="license:*", limit = 0)
##D cr_funders('100000001', works = TRUE, cursor = "*", cursor_max = 500,
##D    limit = 100, facet=TRUE)
##D 
##D # Curl options
##D cr_funders(dois='10.13039/100000001', verbose = TRUE)
##D 
##D # If not found, and > 1 DOI given, those not found dropped
##D cr_funders(dois=c("adfadfaf","asfasf"))
##D cr_funders(dois=c("adfadfaf","asfasf"), works=TRUE)
##D cr_funders(dois=c("10.13039/100000001","asfasf"))
##D cr_funders(dois=c("10.13039/100000001","asfasf"), works=TRUE)
##D 
##D # Use the cursor for deep paging
##D cr_funders('100000001', works = TRUE, cursor = "*", cursor_max = 500,
##D    limit = 100)
##D cr_funders(c('100000001', '100000002'), works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_funders_(query = 'nsf')
##D cr_funders_('10.13039/100000001')
##D cr_funders_(query = 'science', parse=TRUE)
##D cr_funders_('10.13039/100000001', works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D cr_funders_('10.13039/100000001', works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100, parse = TRUE)
##D 
##D # field queries
##D ## query.container-title
##D cr_funders('10.13039/100000001', works = TRUE,
##D   flq = c(`query.container-title` = 'Ecology'))
##D 
##D # select only certain fields to return
##D res <- cr_funders('10.13039/100000001', works = TRUE, 
##D   select = c('DOI', 'title'))
##D names(res$data)
## End(Not run)



