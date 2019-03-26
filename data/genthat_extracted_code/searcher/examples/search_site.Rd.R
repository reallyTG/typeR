library(searcher)


### Name: search_site
### Title: Search a Query on a Search Portal in a Web Browser
### Aliases: search_site search_google search_bing search_duckduckgo
###   search_ddg search_ixquick search_stackoverflow search_so
###   search_github search_gh search_bitbucket search_bb

### ** Examples

# Search in a generic way
search_site("r-project", "google")

# Search Google
search_google("r-project")

# Search Bing
search_bing("Microsoft R")

# Search DuckDuckGo
search_duckduckgo("R language")

# Search ixquick
search_ixquick("RStudio IDE")

# Search StackOverflow for Convolutions in the r tag
search_stackoverflow("convolutions")

# Search all languages on StackOverflow for convolutions
search_stackoverflow("convolutions", rlang = FALSE)

# Search GitHub Issues for bivariate normal in the language:r
search_github("bivariate normal")

# Search all languages on GitHub Issues for bivariate normal
search_github("bivariate normal", rlang = FALSE)

# Search BitBucket for assertions
search_bitbucket("assertions")

## Not run: 
##D # On error, automatically search the message on google
##D options(error = searcher("google"))
##D options(error = search_google)
## End(Not run)



