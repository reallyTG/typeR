library(federalregister)


### Name: fr_search
### Title: Search the Federal Register
### Aliases: fr_search

### ** Examples

## Not run: 
##D fr_search(presidential_document_type='executive_order',
##D           fields=c('executive_order_number','president','raw_text_url','document_number'),
##D           per_page=30)
##D 
##D fr_search(term='climate', publication_date=list(gte='2013-01-01',lte='2013-03-31'))
## End(Not run)



