library(wikisourcer)


### Name: wikisource_page
### Title: Download a page from Wikisource
### Aliases: wikisource_page

### ** Examples


## Not run: 
##D # download Sonnet 18 of Shakespeare
##D wikisource_page("https://en.wikisource.org/wiki/Sonnet_18_(Shakespeare)", page = "Sonnet 18")
##D 
##D # download Sonnets 116, 73 and 130 of Shakespeare
##D library(purrr)
##D 
##D urls <- paste0("https://en.wikisource.org/wiki/Sonnet_", c(116, 73, 130), "_(Shakespeare)")
##D sonnets <- map2_df(urls, paste0("Sonnet ", c(116, 73, 130)), wikisource_page)
## End(Not run)




