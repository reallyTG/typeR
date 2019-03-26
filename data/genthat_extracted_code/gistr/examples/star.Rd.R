library(gistr)


### Name: star
### Title: Star a gist
### Aliases: star unstar star_check

### ** Examples

## Not run: 
##D id <- '4ac33b9c00751fddc7f8'
##D gist(id) %>% star()
##D gist(id) %>% star_check()
##D gist(id) %>% unstar()
##D gist(id) %>% unstar() %>% star()
##D gist(id) %>% star_check()
##D gist(id) %>%
##D   star() %>%
##D   star_check()
##D   
##D # pass in a url
##D x <- "https://gist.github.com/expersso/4ac33b9c00751fddc7f8"
##D gist(x) %>% star
##D gist(x) %>% unstar
## End(Not run)



