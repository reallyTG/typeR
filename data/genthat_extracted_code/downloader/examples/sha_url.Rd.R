library(downloader)


### Name: sha_url
### Title: Download a file from a URL and find a SHA-1 hash of it
### Aliases: sha_url

### ** Examples

## Not run: 
##D # Get the SHA hash of a file. It will print the text below and return
##D # the hash as a string. This is a very long URL; break it up so it can be
##D # seen more easily in the examples.
##D test_url <- paste0("https://gist.github.com/wch/dae7c106ee99fe1fdfe7",
##D                    "/raw/db0c9bfe0de85d15c60b0b9bf22403c0f5e1fb15/test.r")
##D sha_url(test_url)
##D # Command for sourcing the URL:
##D #  downloader::source_url("https://gist.github.com/wch/dae7c106ee99fe1fdfe7
##D #  /raw/db0c9bfe0de85d15c60b0b9bf22403c0f5e1fb15/test.r",
##D #    sha="9b8ff5213e32a871d6cb95cce0bed35c53307f61")
##D # [1] "9b8ff5213e32a871d6cb95cce0bed35c53307f61"
## End(Not run)



