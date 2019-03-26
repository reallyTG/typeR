library(reutils)


### Name: [,einfo,ANY,missing-method
### Title: EInfo accessors
### Aliases: [,einfo,ANY,missing-method [[,einfo,ANY-method

### ** Examples

## Not run: 
##D e <- einfo("pubmed")
##D e[1:5]
##D e["Description"]
##D e[["Links"]]
##D 
##D e2 <- einfo("pubmed", retmode = 'json')
##D e2[["header"]]
##D e2[["einforesult"]][["dbinfo"]][["description"]]
## End(Not run)



