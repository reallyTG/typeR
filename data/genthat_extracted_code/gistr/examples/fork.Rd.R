library(gistr)


### Name: fork
### Title: Fork a gist
### Aliases: fork

### ** Examples

## Not run: 
##D # fork a gist
##D gists()[[1]] %>% fork()
##D 
##D # browse to newly forked gist
##D gist(id='0831f3fbd83ac4d46451') %>% fork() %>% browse()
##D 
##D # extract the last one
##D gist(id='1642874') %>%
##D  forks() %>%
##D  .[length(.)]
## End(Not run)



