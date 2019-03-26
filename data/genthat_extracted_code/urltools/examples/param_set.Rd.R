library(urltools)


### Name: param_set
### Title: Set the value associated with a parameter in a URL's query.
### Aliases: param_set

### ** Examples

# Set a URL parameter where there's already a key for that
param_set("https://en.wikipedia.org/api.php?action=query", "action", "pageinfo")

# Set a URL parameter where there isn't.
param_set("https://en.wikipedia.org/api.php?list=props", "action", "pageinfo")




