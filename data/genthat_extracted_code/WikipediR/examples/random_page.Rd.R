library(WikipediR)


### Name: random_page
### Title: Retrieve the page content of a random MediaWiki page
### Aliases: random_page

### ** Examples

#A page from Wikipedia
wp_content <- random_page("en","wikipedia")

#A page from the mainspace on Wikipedia
wp_article_content <- random_page("en","wikipedia", namespaces = 0)



