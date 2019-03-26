library(fulltext)


### Name: ft_serialize
### Title: Serialize raw text to other formats, including to disk
### Aliases: ft_serialize ft_get_keys

### ** Examples

## Not run: 
##D res <- ft_get('10.7717/peerj.228')
##D 
##D # if articles in xml format, parse the XML
##D (out <- ft_serialize(ft_collect(res), to='xml'))
##D out$peerj$data$data[[1]] # the xml
##D 
##D # From XML to JSON
##D (out <- ft_serialize(ft_collect(res), to='json'))
##D out$peerj$data$data$`10.7717/peerj.228` # the json
##D jsonlite::fromJSON(out$peerj$data$data$`10.7717/peerj.228`)
##D 
##D # To a list
##D out <- ft_serialize(ft_collect(res), to='list')
##D out$peerj$data$data
##D out$peerj$data$data[[1]]$body$sec$title
## End(Not run)



