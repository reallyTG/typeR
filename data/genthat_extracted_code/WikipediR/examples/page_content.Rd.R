library(WikipediR)


### Name: page_content
### Title: Retrieves MediaWiki page content
### Aliases: page_content

### ** Examples

#Content from a Wikimedia project
wp_content <- page_content("en","wikipedia", page_name = "Aaron Halfaker")

#Content by ID
wp_content <- page_content("en", "wikipedia", page_id = 12)

#Content from a non-Wikimedia project
rw_content <- page_content(domain = "rationalwiki.org", page_name = "New Age")



