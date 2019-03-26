library(fulltext)


### Name: ft_abstract
### Title: Get abstracts
### Aliases: ft_abstract ft_abstract_ls

### ** Examples

# List publishers included
ft_abstract_ls()

## Not run: 
##D # PLOS
##D ## search
##D (res <- ft_search(query = 'biology', from = 'plos', limit = 25, 
##D    plosopts = list(fq = list('doc_type:full', '-article_type:correction',
##D                   '-article_type:viewpoints'))))
##D ## get abstracts
##D dois <- res$plos$data$id
##D (out <- ft_abstract(x = dois, from = "plos"))
##D out$plos
##D 
##D # Scopus
##D opts <- list(key = Sys.getenv('ELSEVIER_SCOPUS_KEY'))
##D 
##D ## search
##D (res <- ft_search(query = 'biology', from = 'scopus', scopusopts = opts, 
##D   limit = 25))
##D ## get abstract
##D dois <- na.omit(res$scopus$data$`prism:doi`)
##D out <- ft_abstract(x = dois[1], from = "scopus", scopusopts = opts)
##D out
##D out$scopus
##D 
##D (out <- ft_abstract(x = dois[1:5], from = "scopus", scopusopts = opts))
##D 
##D # use scopus Ids
##D (res <- ft_search(query = 'biology', from = 'scopus', scopusopts = opts, 
##D   limit = 50))
##D ids <- fulltext:::strextract(res$scopus$data$`dc:identifier`, "[0-9]+")
##D (out <- ft_abstract(x = ids[1:4], from = 'scopus', 
##D   scopusopts = list(
##D     key = Sys.getenv('ELSEVIER_SCOPUS_KEY'),
##D     id_type = "scopus_id"
##D   )
##D ))
##D 
##D # Microsoft
##D key <- Sys.getenv("MICROSOFT_ACADEMIC_KEY")
##D (res <- ft_search("Y=[2010, 2012)", from = "microsoft", 
##D   maopts = list(key = key)))
##D ids <- res$ma$data$Id
##D (out <- ft_abstract(x = ids, from = "microsoft",
##D   maopts = list(
##D     key = Sys.getenv('MICROSOFT_ACADEMIC_KEY')
##D   )
##D ))
##D out$ma
##D cat(unlist(lapply(out$ma, "[[", "abstract")), sep = "\n\n")
##D 
##D # Crossref
##D (res <- ft_search("ecology", from = "crossref", 
##D   crossrefopts = list(filter = c(has_abstract = TRUE))))
##D ids <- res$crossref$data$doi
##D (out <- ft_abstract(x = ids, from = "crossref"))
##D out$crossref
## End(Not run)



