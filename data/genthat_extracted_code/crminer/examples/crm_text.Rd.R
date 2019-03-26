library(crminer)


### Name: crm_text
### Title: Get full text
### Aliases: crm_text

### ** Examples

## Not run: 
##D # set a temp dir. cache path
##D crm_cache$cache_path_set(path = "crminer", type = "tempdir")
##D ## you can set the entire path directly via the `full_path` arg
##D ## like crm_cache$cache_path_set(full_path = "your/path")
##D 
##D ## pensoft
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### xml
##D crm_text(url=links, type='xml')
##D ### pdf
##D crm_text(url=links, type="pdf", read = FALSE)
##D crm_text(links, "pdf")
##D 
##D ## hindawi
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### xml
##D crm_text(links, 'xml')
##D ### pdf
##D crm_text(links, "pdf", read=FALSE)
##D crm_text(links, "pdf")
##D 
##D ## DOIs w/ full text, and with CC-BY 3.0 license
##D data(dois_crminer_ccby3)
##D (links <- crm_links(dois_crminer_ccby3[40], "all"))
##D # crm_text(links, 'pdf')
##D 
##D ## You can use crm_xml, crm_plain, and crm_pdf to go directly to
##D ## that format
##D (links <- crm_links(dois_crminer_ccby3[5], "all"))
##D crm_xml(links)
##D 
##D ### Caching, for PDFs
##D if (requireNamespace("rcrossref")) {
##D   library("rcrossref")
##D   out <- cr_members(2258, filter=c(has_full_text = TRUE), works = TRUE)
##D   # (links <- crm_links(out$data$DOI[10], "all"))
##D   # crm_text(links, type = "pdf", cache=FALSE)
##D   # system.time( cacheyes <- crm_text(links, type = "pdf", cache=TRUE) )
##D   ### second time should be faster
##D   # system.time( cacheyes <- crm_text(links, type = "pdf", cache=TRUE) )
##D   # system.time( cacheno <- crm_text(links, type = "pdf", cache=FALSE) )
##D   # identical(cacheyes, cacheno)
##D }
##D 
##D ## elsevier
##D ## requires authentication
##D ### load some Elsevier DOIs
##D data(dois_elsevier)
##D 
##D ## set key first - OR set globally - See ?auth
##D # Sys.setenv(CROSSREF_TDM_ELSEVIER = "your-key")
##D ## XML
##D link <- crm_links("10.1016/j.funeco.2010.11.003", "xml")
##D # res <- crm_text(url = link, type = "xml")
##D ## plain text
##D link <- crm_links("10.1016/j.funeco.2010.11.003", "plain")
##D # res <- crm_text(url = link, "plain")
##D 
##D ## Wiley
##D ## requires authentication
##D ### load some Wiley DOIs
##D data(dois_wiley)
##D 
##D ## set key first - OR set globally - See ?auth
##D # Sys.setenv(CROSSREF_TDM = "your-key")
##D 
##D ### all wiley
##D tmp <- crm_links("10.1111/apt.13556", "all")
##D # crm_text(url = tmp, type = "pdf", cache=FALSE,
##D #   overwrite_unspecified = TRUE)
##D 
##D #### older dates for Wiley
##D # tmp <- crm_links(dois_wiley$set2[1], "all")
##D # crm_text(tmp, type = "pdf", cache=FALSE,
##D #    overwrite_unspecified=TRUE)
##D 
##D ### Wiley paper with CC By 4.0 license
##D # tmp <- crm_links("10.1113/jp272944", "all")
##D # crm_text(tmp, type = "pdf", cache=FALSE)
## End(Not run)



