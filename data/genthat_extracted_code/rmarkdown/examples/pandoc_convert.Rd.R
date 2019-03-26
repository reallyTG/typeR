library(rmarkdown)


### Name: pandoc_convert
### Title: Convert a document with pandoc
### Aliases: pandoc_convert

### ** Examples

## Not run: 
##D library(rmarkdown)
##D 
##D # convert markdown to various formats
##D pandoc_convert("input.md", to = "html")
##D pandoc_convert("input.md", to = "pdf")
##D 
##D # process citations
##D pandoc_convert("input.md", to = "html", citeproc = TRUE)
##D 
##D # add some pandoc options
##D pandoc_convert("input.md", to="pdf", options = c("--listings"))
## End(Not run)



