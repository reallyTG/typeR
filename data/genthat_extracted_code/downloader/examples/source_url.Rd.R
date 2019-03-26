library(downloader)


### Name: source_url
### Title: Download an R file from a URL and source it
### Aliases: source_url

### ** Examples

## Not run: 
##D # Source the a sample file
##D 
##D # This is a very long URL; break it up so it can be seen more easily in the
##D # examples.
##D test_url <- paste0("https://gist.github.com/wch/dae7c106ee99fe1fdfe7",
##D                    "/raw/db0c9bfe0de85d15c60b0b9bf22403c0f5e1fb15/test.r")
##D downloader::source_url(test_url,
##D                        sha = "9b8ff5213e32a871d6cb95cce0bed35c53307f61")
##D 
##D # Find the hash of a file
##D downloader::sha_url(test_url)
## End(Not run)



