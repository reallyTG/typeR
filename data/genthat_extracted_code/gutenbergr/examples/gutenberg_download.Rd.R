library(gutenbergr)


### Name: gutenberg_download
### Title: Download one or more works using a Project Gutenberg ID
### Aliases: gutenberg_download

### ** Examples


## Not run: 
##D library(dplyr)
##D 
##D # download The Count of Monte Cristo
##D gutenberg_download(1184)
##D 
##D # download two books: Wuthering Heights and Jane Eyre
##D books <- gutenberg_download(c(768, 1260), meta_fields = "title")
##D books
##D books %>% count(title)
##D 
##D # download all books from Jane Austen
##D austen <- gutenberg_works(author == "Austen, Jane") %>%
##D   gutenberg_download(meta_fields = "title")
##D 
##D austen
##D austen %>%
##D  count(title)
## End(Not run)




