library(yaml)


### Name: read_yaml
### Title: Read a YAML file
### Aliases: read_yaml
### Keywords: programming data manip

### ** Examples

## Not run: 
##D   # reading from a file connection
##D   filename <- tempfile()
##D   cat("test: data\n", file = filename)
##D   con <- file(filename, "r")
##D   read_yaml(con)
##D   close(con)
##D 
##D   # using a filename to specify input file
##D   read_yaml(filename)
## End(Not run)

  # reading from a character vector
  read_yaml(text="- hey\n- hi\n- hello")



