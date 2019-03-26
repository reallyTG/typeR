library(WikipediR)


### Name: categories_in_page
### Title: Retrieves categories associated with a page.
### Aliases: categories_in_page

### ** Examples


#Retrieve the categories for the "New Age" article on en.wiki
cats <- categories_in_page("en", "wikipedia", pages = "New Age")

#Retrieve the categories for the "New Age" article on rationalwiki.
rw_cats <- categories_in_page(domain = "rationalwiki.org", pages = "New Age")



