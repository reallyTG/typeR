library(fulltext)


### Name: ft_search
### Title: Search for full text
### Aliases: ft_search ft_search_ls

### ** Examples

# List publishers included
ft_search_ls()

## Not run: 
##D # Plos
##D (res1 <- ft_search(query='ecology', from='plos'))
##D res1$plos
##D ft_search(query='climate change', from='plos', limit=500, 
##D   plosopts=list(
##D    fl=c('id','author','eissn','journal','counter_total_all',
##D    'alm_twitterCount')))
##D 
##D # Crossref
##D (res2 <- ft_search(query='ecology', from='crossref'))
##D res2$crossref
##D 
##D # BioRxiv
##D (res <- ft_search(query='owls', from='biorxiv'))
##D res$biorxiv
##D 
##D # Entrez
##D (res <- ft_search(query='ecology', from='entrez'))
##D res$entrez
##D 
##D # arXiv
##D (res <- ft_search(query='ecology', from='arxiv'))
##D res$arxiv
##D 
##D # BMC - can be very slow
##D (res <- ft_search(query='ecology', from='bmc'))
##D res$bmc
##D 
##D # Europe PMC
##D (res <- ft_search(query='ecology', from='europmc'))
##D res$europmc
##D ## get the next batch of results, using the cursorMark result
##D ft_search(query='ecology', from='europmc', 
##D   euroopts = list(cursorMark = res$europmc$cursorMark))
##D 
##D # Scopus
##D (res <- ft_search(query = 'ecology', from = 'scopus', limit = 100,
##D    scopusopts = list(key = Sys.getenv('ELSEVIER_SCOPUS_KEY'))))
##D res$scopus
##D ## pagination
##D (res <- ft_search(query = 'ecology', from = 'scopus', 
##D    scopusopts = list(key = Sys.getenv('ELSEVIER_SCOPUS_KEY')), limit = 5))
##D ## lots of results
##D (res <- ft_search(query = "ecology community elk cow", from = 'scopus', 
##D    limit = 100,
##D    scopusopts = list(key = Sys.getenv('ELSEVIER_SCOPUS_KEY'))))
##D res$scopus
##D ## facets
##D (res <- ft_search(query = 'ecology', from = 'scopus', 
##D    scopusopts = list(
##D      key = Sys.getenv('ELSEVIER_SCOPUS_KEY'), 
##D      facets = "subjarea(count=5)"
##D    ), limit = 5))
##D res$scopus
##D 
##D # PLOS, Crossref, and arxiv
##D (res <- ft_search(query='ecology', from=c('plos','crossref','arxiv')))
##D res$plos
##D res$arxiv
##D res$crossref
##D 
##D # Microsoft academic search
##D key <- Sys.getenv("MICROSOFT_ACADEMIC_KEY")
##D (res <- ft_search("Y='19'...", from = "microsoft", maopts = list(key = key)))
##D res$ma
##D res$ma$data$DOI
## End(Not run)



