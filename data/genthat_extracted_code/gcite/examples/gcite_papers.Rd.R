library(gcite)


### Name: gcite_papers
### Title: Parse Google Citation Index
### Aliases: gcite_papers gcite_papers.xml_nodeset
###   gcite_papers.xml_document gcite_papers.character gcite_papers.default

### ** Examples

if (!is_travis()) {
library(httr)
library(rvest) 
url = "https://scholar.google.com/citations?user=T9eqZgMAAAAJ"
url = gcite_url(url = url, pagesize = 10, cstart = 0) 
ind = gcite_papers(url)
doc = content(httr::GET(url))
ind = gcite_papers(doc)
ind_nodes = rvest::html_nodes(doc, "#gsc_a_b")
ind = gcite_papers(ind_nodes)
}



