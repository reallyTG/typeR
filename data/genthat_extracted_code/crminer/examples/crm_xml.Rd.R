library(crminer)


### Name: crm_xml
### Title: Get full text XML
### Aliases: crm_xml

### ** Examples

## Not run: 
##D ## peerj
##D x <- crm_xml("https://peerj.com/articles/2356.xml")
##D 
##D ## pensoft
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### xml
##D crm_xml(url=links)
##D 
##D ## hindawi
##D data(dois_pensoft)
##D (links <- crm_links(dois_pensoft[1], "all"))
##D ### xml
##D crm_xml(links)
## End(Not run)



