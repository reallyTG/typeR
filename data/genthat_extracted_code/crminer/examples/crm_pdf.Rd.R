library(crminer)


### Name: crm_pdf
### Title: Get full text PDFs
### Aliases: crm_pdf

### ** Examples

## Not run: 
##D # set a temp dir. cache path
##D crm_cache$cache_path_set(path = "crminer", type = "tempdir")
##D ## you can set the entire path directly via the `full_path` arg
##D ## like crm_cache$cache_path_set(full_path = "your/path")
##D 
##D ## peerj
##D x <- crm_pdf("https://peerj.com/articles/2356.pdf")
##D 
##D ## pensoft
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### pdf
##D crm_text(url=links, type="pdf", read = FALSE)
##D crm_text(links, "pdf")
##D 
##D ## hindawi
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### pdf
##D crm_text(links, "pdf", read=FALSE)
##D crm_text(links, "pdf")
##D 
##D ### Caching, for PDFs
##D # out <- cr_members(2258, filter=c(has_full_text = TRUE), works = TRUE)
##D # (links <- crm_links(out$data$DOI[10], "all"))
##D # crm_text(links, type = "pdf", cache=FALSE)
##D # system.time( cacheyes <- crm_text(links, type = "pdf", cache=TRUE) )
##D ### second time should be faster
##D # system.time( cacheyes <- crm_text(links, type = "pdf", cache=TRUE) )
##D # system.time( cacheno <- crm_text(links, type = "pdf", cache=FALSE) )
##D # identical(cacheyes, cacheno)
## End(Not run)



