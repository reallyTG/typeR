library(urltools)


### Name: param_remove
### Title: Remove key-value pairs from query strings
### Aliases: param_remove

### ** Examples

# Remove multiple parameters from a URL
param_remove(urls = "https://en.wikipedia.org/wiki/api.php?action=list&type=query&format=json",
            keys = c("action","format"))



