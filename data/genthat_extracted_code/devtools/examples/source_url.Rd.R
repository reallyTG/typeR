library(devtools)


### Name: source_url
### Title: Run a script through some protocols such as http, https, ftp,
###   etc.
### Aliases: source_url

### ** Examples

## Not run: 
##D 
##D source_url("https://gist.github.com/hadley/6872663/raw/hi.r")
##D 
##D # With a hash, to make sure the remote file hasn't changed
##D source_url("https://gist.github.com/hadley/6872663/raw/hi.r",
##D   sha1 = "54f1db27e60bb7e0486d785604909b49e8fef9f9")
##D 
##D # With a truncated hash
##D source_url("https://gist.github.com/hadley/6872663/raw/hi.r",
##D   sha1 = "54f1db27e60")
## End(Not run)



