library(googleLanguageR)


### Name: gl_translate
### Title: Translate the language of text within a request
### Aliases: gl_translate

### ** Examples


## Not run: 
##D 
##D text <- "to administer medicine to animals is frequently a very difficult matter,
##D   and yet sometimes it's necessary to do so"
##D 
##D gl_translate(text, target = "ja")
##D 
##D # translate webpages using rvest to process beforehand
##D library(rvest)
##D library(googleLanguageR)
##D 
##D # translate webpages
##D 
##D # dr.dk article
##D my_url <- "http://bit.ly/2yhrmrH"
##D 
##D ## in this case the content to translate is in css selector '.wcms-article-content'
##D read_html(my_url) %>%
##D   html_node(css = ".wcms-article-content") %>%
##D   html_text %>%
##D   gl_translate(format = "html")
##D 
## End(Not run)




