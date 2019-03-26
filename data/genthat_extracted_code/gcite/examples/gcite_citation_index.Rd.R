library(gcite)


### Name: gcite_citation_index
### Title: Parse Google Citation Index
### Aliases: gcite_citation_index gcite_citation_index.xml_node
###   gcite_citation_index.xml_document gcite_citation_index.character

### ** Examples

if (!is_travis()) {
library(httr)
library(rvest) 
library(gcite)
url = "https://scholar.google.com/citations?user=T9eqZgMAAAAJ"
url = gcite_url(url = url, pagesize = 10, cstart = 0) 
ind = gcite_citation_index(url)
doc = content(httr::GET(url))
ind = gcite_citation_index(doc)
ind_nodes = rvest::html_nodes(doc, "#gsc_rsb_st")[[1]]
ind = gcite_citation_index(ind_nodes)
}



