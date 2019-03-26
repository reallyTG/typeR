library(ALA4R)


### Name: check_assertions
### Title: Check assertions in occurrences object
### Aliases: check_assertions

### ** Examples

## Not run: 
##D  ##download species data with all possible assertions
##D 
##D  x <- occurrences(taxon="golden bowerbird", download_reason_id=10, qa=ala_fields("assertions")$name)
##D 
##D  asserts <- check_assertions(x)
##D  ## this is a data.frame of assertions, their description and column names
##D 
##D  ## list the descriptions of all (current) assertions
##D  asserts$description
##D 
##D  tmp <- x$data[, names(x$data) %in% asserts$name] ## assertion columns from data
##D  which(colSums(tmp)>0) ## discard those not seen in the data
## End(Not run)



