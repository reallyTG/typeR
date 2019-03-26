library(WikipediR)


### Name: pages_in_category
### Title: Retrieves a list of category members.
### Aliases: pages_in_category

### ** Examples


#Retrieve the pages in the "New Age" category on en.wiki
cats <- pages_in_category("en", "wikipedia", categories = "New Age")

#Retrieve the pages in the "New Age" category on rationalwiki.
rw_cats <- pages_in_category(domain = "rationalwiki.org", categories = "New Age")



