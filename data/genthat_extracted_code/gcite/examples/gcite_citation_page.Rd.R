library(gcite)


### Name: gcite_citation_page
### Title: Parse Google Citation Index
### Aliases: gcite_citation_page gcite_citation_page.xml_nodeset
###   gcite_citation_page.xml_document gcite_citation_page.character
###   gcite_citation_page.list gcite_citation_page.default

### ** Examples

if (!is_travis()) {
library(httr)
library(rvest)
url = paste0("https://scholar.google.com/citations?view_op=view_citation&", 
"hl=en&oe=ASCII&user=T9eqZgMAAAAJ&pagesize=100&", 
"citation_for_view=T9eqZgMAAAAJ:W7OEmFMy1HYC")
url = gcite_url(url = url, pagesize = 10, cstart = 0) 
ind = gcite_citation_page(url)
doc = content(httr::GET(url))
ind = gcite_citation_page(doc)
ind_nodes = html_nodes(doc, "#gsc_vcd_table div")
ind_nodes = html_nodes(ind_nodes, xpath = '//div[@class = "gs_scl"]')  
ind = gcite_citation_page(ind_nodes)
}



