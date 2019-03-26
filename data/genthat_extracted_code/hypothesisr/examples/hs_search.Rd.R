library(hypothesisr)


### Name: hs_search
### Title: Search hypothes.is annotations
### Aliases: hs_search

### ** Examples

# Search for no more than 5 annotations containing the text "ulysses"
hs_search(text = "ulysses", limit = 5)
# Search with a custom field for tags
hs_search(custom = list(tags = "todo"))
# use the 'uri.parts' field to find annotations on a given domain (exclude
# the TLD, as this will result in all annotations on sites with, e.g., .org,
# as well.)
hs_search(custom = list(uri.parts = "programminghistorian"))



