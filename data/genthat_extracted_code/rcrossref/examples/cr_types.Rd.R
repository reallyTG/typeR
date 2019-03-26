library(rcrossref)


### Name: cr_types
### Title: Search CrossRef types
### Aliases: cr_types cr_types_

### ** Examples

## Not run: 
##D cr_types()
##D cr_types("monograph")
##D cr_types("monograph", works=TRUE)
##D cr_types(c('monograph', 'book-set', 'book', 'book-track'))
##D cr_types(c('monograph', 'book-set'), works=TRUE)
##D 
##D ## get facets back
##D cr_types("journal-article", works=TRUE, facet=TRUE)$facets
##D cr_types("monograph", works=TRUE, facet="license:*", limit = 0)
##D cr_types(c('monograph', 'book-set'), works=TRUE, facet=TRUE)
##D 
##D # Use the cursor for deep paging
##D cr_types("journal-article", works = TRUE, cursor = "*",
##D    cursor_max = 500, limit = 100)
##D cr_types(c('monograph', 'book-set'), works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D 
##D # query doesn't work unless using works=TRUE
##D ### you get results, but query param is silently dropped
##D cr_types(query = "ecology")
##D 
##D # print progress - only works when passing more than one type
##D cr_types(c('monograph', 'book-set'), works=TRUE, .progress='text')
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_types_('monograph')
##D cr_types_('monograph', parse = TRUE)
##D cr_types_("journal-article", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D cr_types_("journal-article", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100, parse = TRUE)
##D 
##D # field queries
##D ## query.container-title
##D cr_types("journal-article", works = TRUE,
##D   flq = c(`query.container-title` = 'Ecology'))
##D 
##D # select only certain fields to return
##D res <- cr_types("journal-article", works = TRUE, select = c('DOI', 'title'))
##D names(res$data)
## End(Not run)



