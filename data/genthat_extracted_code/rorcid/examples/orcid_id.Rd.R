library(rorcid)


### Name: orcid_id
### Title: Get data for particular ORCID's
### Aliases: orcid_id

### ** Examples

## Not run: 
##D res <- orcid_id(orcid = "0000-0002-9341-7985")
##D res$`0000-0002-9341-7985`
##D res$`0000-0002-9341-7985`$`name`
##D res$`0000-0002-9341-7985`$`other-names`
##D res$`0000-0002-9341-7985`$`biography`
##D res$`0000-0002-9341-7985`$`researcher-urls`
##D res$`0000-0002-9341-7985`$`emails`
##D res$`0000-0002-9341-7985`$`addresses`
##D res$`0000-0002-9341-7985`$`keywords`
##D res$`0000-0002-9341-7985`$`external-identifiers`
##D res$`0000-0002-9341-7985`$`emails`
##D 
##D ids <- c("0000-0003-1620-1408", "0000-0002-9341-7985")
##D res <- lapply(ids, orcid_id)
##D vapply(res, function(x) x[[1]]$name$`family-name`$value, "")
## End(Not run)



