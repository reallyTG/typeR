library(crminer)


### Name: crm_links
### Title: Get full text links from a DOI
### Aliases: crm_links

### ** Examples

## Not run: 
##D data(dois_crminer)
##D 
##D # pdf link
##D crm_links(doi = "10.5555/515151", "pdf")
##D 
##D # xml and plain text links
##D crm_links(dois_crminer[1], "pdf")
##D crm_links(dois_crminer[6], "xml")
##D crm_links(dois_crminer[7], "plain")
##D crm_links(dois_crminer[1]) # all is the default
##D 
##D # pdf link
##D crm_links(doi = "10.5555/515151", "pdf")
##D crm_links(doi = "10.3897/phytokeys.52.5250", "pdf")
##D 
##D # many calls, use e.g., lapply
##D lapply(dois_crminer[1:3], crm_links)
## End(Not run)



