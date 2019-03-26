library(rcrossref)


### Name: cr_journals
### Title: Search CrossRef journals
### Aliases: cr_journals cr_journals_

### ** Examples

## Not run: 
##D cr_journals(issn="2167-8359")
##D cr_journals()
##D cr_journals(issn="2167-8359", works=TRUE)
##D cr_journals(issn=c('1803-2427','2326-4225'))
##D cr_journals(query="ecology")
##D cr_journals(issn="2167-8359", query='ecology', works=TRUE,
##D    sort='score', order="asc")
##D cr_journals(issn="2167-8359", query='ecology', works=TRUE, sort='score',
##D    order="desc")
##D cr_journals(issn="2167-8359", works=TRUE,
##D    filter=c(from_pub_date='2014-03-03'))
##D cr_journals(query="peerj")
##D cr_journals(issn='1803-2427', works=TRUE)
##D cr_journals(issn='1803-2427', works=TRUE, sample=1)
##D cr_journals(limit=2)
##D 
##D ## get facets back
##D cr_journals('1803-2427', works=TRUE, facet=TRUE)
##D cr_journals('1803-2427', works=TRUE, facet="published:*", limit = 0)
##D cr_journals(issn=c('1803-2427','2326-4225'), works=TRUE,
##D   facet="published:*", limit = 10)
##D 
##D # Use the cursor for deep paging
##D cr_journals(issn='1932-6203', works = TRUE, cursor = "*", cursor_max = 500,
##D    limit = 100)
##D cr_journals(c('1932-6203', '0028-0836'), works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D 
##D # fails, if you want works, you must give an ISSN
##D # cr_journals(query = "ecology", filter=c(has_full_text = TRUE),
##D #    works = TRUE)
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_journals_(query = 'ecology')
##D cr_journals_("2167-8359")
##D cr_journals_(query = 'ecology', parse=TRUE)
##D cr_journals_("2167-8359", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100)
##D cr_journals_("2167-8359", works = TRUE, cursor = "*",
##D    cursor_max = 300, limit = 100, parse = TRUE)
##D 
##D # field queries
##D ## query.author
##D cr_journals("2167-8359", works = TRUE, flq = c(`query.author` = 'Jane'))
##D 
##D # select only certain fields to return
##D res <- cr_journals('2167-8359', works = TRUE, 
##D   select = c('DOI', 'title'))
##D names(res$data)
## End(Not run)



