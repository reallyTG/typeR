library(request)


### Name: api_write
### Title: Write helper
### Aliases: api_write

### ** Examples

## Not run: 
##D ## write to disk
##D ff <- tempfile(fileext = ".json")
##D api('https://api.github.com/') %>%
##D   api_path(repos, ropensci, rgbif, issues) %>%
##D   api_write(ff)
##D jsonlite::fromJSON(ff)
## End(Not run)



