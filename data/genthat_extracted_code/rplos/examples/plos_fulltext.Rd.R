library(rplos)


### Name: plos_fulltext
### Title: Get full text xml of PLOS papers given a DOI
### Aliases: plos_fulltext print.plosft

### ** Examples

## Not run: 
##D plos_fulltext(doi='10.1371/journal.pone.0086169')
##D plos_fulltext(c('10.1371/journal.pone.0086169',
##D   '10.1371/journal.pbio.1001845'))
##D dois <- searchplos(q = "*:*", 
##D   fq = list('doc_type:full', 'article_type:"Research Article"'), 
##D   limit = 3)$data$id
##D out <- plos_fulltext(dois)
##D out[dois[1]]
##D out[1:2]
##D 
##D # Extract text from the XML strings - xml2 package required
##D if (requireNamespace("xml2")) {
##D   library("xml2")
##D   lapply(out, function(x){
##D     tmp <- xml2::read_xml(x)
##D     xml2::xml_find_all(tmp, "//ref-list//ref")
##D   })
##D }
##D 
## End(Not run)



