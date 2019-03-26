library(rcrossref)


### Name: cr_abstract
### Title: Get abstract
### Aliases: cr_abstract

### ** Examples

## Not run: 
##D # abstract found
##D cr_abstract(doi = '10.1109/TASC.2010.2088091')
##D 
##D # doi not found
##D # cr_abstract(doi = '10.5284/1011335')
##D 
##D # abstract not found, throws warning
##D # cr_abstract(doi = '10.1126/science.169.3946.635')
##D # cr_abstract(doi = '10.1371/journal.pone.0033693')
##D # cr_abstract(doi = '10.1007/12080.1874-1746')
##D 
##D # cr_abstract(cr_r(1))
##D 
##D # loop through many DOIs, allowing for failures
##D dois <- cr_r(10, filter = c(has_abstract = TRUE))
##D res <- lapply(dois, function(z) tryCatch(cr_abstract(z), error = function(e) e))
## End(Not run)



