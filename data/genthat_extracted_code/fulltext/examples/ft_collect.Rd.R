library(fulltext)


### Name: ft_collect
### Title: Collect article text from local files
### Aliases: ft_collect ft_text ft_text.default ft_text.ft_data

### ** Examples

## Not run: 
##D # Get some data
##D x <- ft_get('10.1371/journal.pone.0086169', from='plos')
##D 
##D # note that the data is not in the object, gives NULL
##D x$plos$data$data
##D 
##D # Collect data from the .xml file
##D y <- x %>% ft_collect()
##D 
##D # note how the data is now in the object
##D y$plos$data$data
##D 
##D # Let's get the actual 
##D ## ft_collect() alone, replaces file pointers with parsed text, 
##D ##  maintaining object structure
##D x %>% ft_collect() 
##D ## pulls the text out of the object
##D x %>% ft_collect() %>% ft_text()
## End(Not run)



