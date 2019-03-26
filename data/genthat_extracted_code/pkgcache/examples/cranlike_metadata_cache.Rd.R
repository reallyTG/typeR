library(pkgcache)


### Name: cranlike_metadata_cache
### Title: Metadata cache for a CRAN-like repository
### Aliases: cranlike_metadata_cache
### Keywords: datasets

### ** Examples

## No test: 
dir.create(cache_path <- tempfile())
cmc <- cranlike_metadata_cache$new(cache_path, bioc = FALSE)
cmc$list()
cmc$list("pkgconfig")
cmc$deps("pkgconfig")
cmc$revdeps("pkgconfig", recursive = FALSE)
## End(No test)



