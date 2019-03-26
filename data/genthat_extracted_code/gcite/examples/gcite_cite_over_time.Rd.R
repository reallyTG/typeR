library(gcite)


### Name: gcite_cite_over_time
### Title: Parse Google Citations Over Time
### Aliases: gcite_cite_over_time gcite_cite_over_time.xml_node
###   gcite_cite_over_time.xml_document gcite_cite_over_time.character
###   gcite_cite_over_time.default

### ** Examples

if (!is_travis()) {
library(httr)
library(rvest) 
url = "https://scholar.google.com/citations?user=T9eqZgMAAAAJ"
url = gcite_url(url = url, pagesize = 10, cstart = 0) 
ind = gcite_cite_over_time(url)
doc = content(httr::GET(url))
ind = gcite_cite_over_time(doc)
ind_nodes = rvest::html_nodes(doc, ".gsc_md_hist_b")
ind = gcite_cite_over_time(ind_nodes)
}



