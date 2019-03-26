library(goldi)


### Name: goldi
### Title: Identify terms present in document.
### Aliases: goldi
### Keywords: Databases Gene Mining, Ontology, Text

### ** Examples

## Not run: 
##D 
##D # Give the free form text
##D doc <- "In this sentence we will talk about ribosomal chaperone activity."
##D 
##D # Load in the included term document matrix for the terms
##D data("TDM.go.df")
##D 
##D # Pipe output and log to /dev/null
##D output = "/dev/null"
##D log = "/dev/null"
##D 
##D # Run the function
##D goldi(doc = doc,
##D       term_tdm = TDM.go.df,
##D       output = output,
##D       log = log,
##D       object = TRUE)
##D 
## End(Not run)




