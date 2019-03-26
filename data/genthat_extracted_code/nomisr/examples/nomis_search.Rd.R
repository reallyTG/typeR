library(nomisr)


### Name: nomis_search
### Title: Search Nomis datasets
### Aliases: nomis_search

### ** Examples

## No test: 
x <- nomis_search(name = '*seekers*')

y <- nomis_search(keywords = 'Claimants')

# Return metadata of all datasets with content_type "sources".
a <- nomis_search(content_type = "sources")


# Return metadata of all datasets with content_type "sources" and
# source ID "acses"
b <- nomis_search(content_type = "sources-acses")
## End(No test)



