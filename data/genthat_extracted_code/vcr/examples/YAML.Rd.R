library(vcr)


### Name: YAML
### Title: The YAML serializer
### Aliases: YAML
### Keywords: internal

### ** Examples

## Not run: 
##D (yy <- YAML$new(path = "stuff2"))
##D fun <- yy$serialize()
##D fun(list(http_interactions = list(response = list(body = "bar"))),
##D   path = yy$path, bytes = FALSE)
##D yy$deserialize_path()
##D yy$deserialize_string(string = "- hey\n- hi\n- hello")
##D yy$deserialize_string(string = "- foo\n- bar\n- 3.14")
## End(Not run)



