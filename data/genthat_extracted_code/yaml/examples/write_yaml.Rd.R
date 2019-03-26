library(yaml)


### Name: write_yaml
### Title: Write a YAML file
### Aliases: write_yaml
### Keywords: data manip

### ** Examples

## Not run: 
##D   # writing to a file connection
##D   filename <- tempfile()
##D   con <- file(filename, "w")
##D   write_yaml(data.frame(a=1:10, b=letters[1:10], c=11:20), con)
##D   close(con)
##D 
##D   # using a filename to specify output file
##D   write_yaml(data.frame(a=1:10, b=letters[1:10], c=11:20), filename)
## End(Not run)



