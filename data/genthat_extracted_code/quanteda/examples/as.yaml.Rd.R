library(quanteda)


### Name: as.yaml
### Title: Convert quanteda dictionary objects to the YAML format
### Aliases: as.yaml

### ** Examples

## Not run: 
##D dict <- dictionary(list(one = c("a b", "c*"), two = c("x", "y", "z??")))
##D cat(yaml <- as.yaml(dict))
##D cat(yaml, file = (yamlfile <- paste0(tempfile(), ".yml")))
##D dictionary(file = yamlfile)
## End(Not run)



