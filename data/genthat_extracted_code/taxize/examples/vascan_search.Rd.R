library(taxize)


### Name: vascan_search
### Title: Search the CANADENSYS Vascan API.
### Aliases: vascan_search
### Keywords: names taxonomy

### ** Examples

## Not run: 
##D vascan_search(q = "Helianthus annuus")
##D vascan_search(q = "Helianthus annuus", raw=TRUE)
##D vascan_search(q = c("Helianthus annuus", "Crataegus dodgei"), raw=TRUE)
##D 
##D # format type
##D ## json
##D c <- vascan_search(q = "Helianthus annuus", format="json", raw=TRUE)
##D library("jsonlite")
##D fromJSON(c, FALSE)
##D 
##D ## xml
##D d <- vascan_search(q = "Helianthus annuus", format="xml", raw=TRUE)
##D library("xml2")
##D xml2::read_xml(d)
##D 
##D # lots of names, in this case 50
##D splist <- names_list(rank='species', size=50)
##D vascan_search(q = splist)
##D 
##D # Curl options
##D invisible(vascan_search(q = "Helianthus annuus", verbose = TRUE))
## End(Not run)



