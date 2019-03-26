library(ckanr)


### Name: fetch
### Title: Download a file
### Aliases: fetch

### ** Examples

## Not run: 
##D ckanr_setup('http://datamx.io')
##D res <- resource_show(id = "6145a539-cbde-4b0d-a3d3-d1a5eb013f5c", as = "table")
##D head(fetch(res$url))
##D fetch(res$url, "disk", "myfile.csv")
##D 
##D # Excel file - requires readxl package
##D ckanr_setup()
##D res <- resource_show(id = "f4f871ae-139f-4acd-a700-8a08a1a04f95", as = "table")
##D head(fetch(res$url))
##D 
##D # XML file
##D ckanr_setup("http://publicdata.eu/")
##D res <- resource_show(id = "ba447d6b-271e-42c2-965e-945f8e26b2ff", as = "table")
##D fetch(res$url)
##D 
##D # HTML file
##D ckanr_setup("http://publicdata.eu/")
##D res <- resource_show(id = "9b5bebd8-ff40-476c-beeb-aae172031d5f", as = "table")
##D fetch(res$url)
##D library("xml2")
##D xml_text(xml_find_one(xml_children(fetch(res$url))[[1]], "title"))
##D 
##D # JSON file, by default reads in to a data.frame for ease of use
##D ckanr_setup("http://publicdata.eu/")
##D res <- resource_show(id = "fa268f29-5e19-4402-a014-3e0fb93936a8", as = "table")
##D head(fetch(res$url))
##D 
##D # SHP file (spatial data, ESRI format)
##D ckanr_setup("http://publicdata.eu/")
##D res <- resource_show(id = "7618b8e2-7308-4964-8024-f13df166e7fd", as = "table")
##D x <- fetch(res$url)
##D class(x)
##D plot(x)
## End(Not run)



