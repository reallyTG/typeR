library(rplos)


### Name: full_text_urls
### Title: Create urls for full text articles in PLOS journals.
### Aliases: full_text_urls

### ** Examples

## Not run: 
##D full_text_urls(doi='10.1371/journal.pone.0086169')
##D full_text_urls(doi='10.1371/journal.pbio.1001845')
##D full_text_urls(doi=c('10.1371/journal.pone.0086169',
##D   '10.1371/journal.pbio.1001845'))
##D 
##D # contains some annotation DOIs
##D dois <- searchplos(q = "*:*", fq='doc_type:full', limit=20)$data$id
##D full_text_urls(dois)
##D 
##D # contains no annotation DOIs
##D dois <- searchplos(q = "*:*", 
##D   fq=list('doc_type:full', 'article_type:"Research Article"'), 
##D limit=20)$data$id
##D full_text_urls(dois)
## End(Not run)



