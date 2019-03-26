library(finch)


### Name: dwca_read
### Title: Parse Darwin Core Archive
### Aliases: dwca_read

### ** Examples

## Not run: 
##D # set up a temporary directory for the example
##D dwca_cache$cache_path_set(path = "finch", type = "tempdir")
##D 
##D dir <- system.file("examples", "0000154-150116162929234", package = "finch")
##D 
##D # Don't read data in
##D (x <- dwca_read(dir, read=FALSE))
##D x$files
##D x$highmeta
##D x$dataset_meta[[1]]
##D x$data
##D 
##D # Read data
##D (x <- dwca_read(dir, read=TRUE))
##D head(x$data[[1]])
##D 
##D # Can pass in a zip file
##D zip <- system.file("examples", "0000154-150116162929234.zip",
##D   package = "finch")
##D (out <- dwca_read(zip))
##D out$files
##D out$highmeta
##D out$emlmeta
##D out$dataset_meta
##D 
##D # Can pass in zip file as a url
##D url <-
##D "https://github.com/ropensci/finch/blob/master/inst/examples/0000154-150116162929234.zip?raw=true"
##D (out <- dwca_read(url))
##D 
##D # another url
##D url <- "http://ipt.jbrj.gov.br/jbrj/archive.do?r=redlist_2013_taxons&v=3.12"
##D (out <- dwca_read(url))
## End(Not run)



