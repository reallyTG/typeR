library(fulltext)


### Name: as.ft_data
### Title: Coerce directory of papers to ft_data object
### Aliases: as.ft_data

### ** Examples

# put a file in the cache in case there aren't any
dir <- file.path(tempdir(), "testing")
dir.create(dir)
file <- system.file("examples", "elife.xml", package = "fulltext")
writeLines(readLines(file), tempfile(tmpdir = dir, fileext = ".xml"))

# call as.ft_data
x <- as.ft_data(path = dir)

# output lives underneath a special list index "cached" 
#   representing already present files
x$cached

## Not run: 
##D # collect chunks
##D if (requireNamespace("pubchunks")) {
##D   library(pubchunks)
##D   res <- ft_collect(x)
##D   pub_chunks(res, c("doi", "title")) %>% pub_tabularize()
##D }
## End(Not run)



