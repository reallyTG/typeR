library(errorist)


### Name: enable_errorist
### Title: Enable or Disable Errorist's Automatic Search
### Aliases: enable_errorist disable_errorist

### ** Examples


### Default search engine is Google

# Enable automatic search
# NB: This is done automatically on package load.
enable_errorist()

# Some code ...

# Disable automatic search
# NB: This is done automatically on package unload via "detach()"
disable_errorist()

#### Custom search engines

# Enable automatic search with custom search engines
# NB: This is done automatically on package load.
enable_errorist(error_search_func   = searcher::search_bing,
                warning_search_func = searcher::search_duckduckgo)

# Some code ...

# Disable automatic search
# NB: This is done automatically on package unload via "detach()"
disable_errorist()



