library(reutils)


### Name: esummary
### Title: esummary - downloading Document Summaries
### Aliases: esummary

### ** Examples

## Retrieve the Document Summary information for a set of
## UIDs frome the Nuccore datanase.
ds <- esummary(c("1060721643", "1060721620", "1060721618"), "nuccore")
ds

## Not run: 
##D ## parse the XML into a data frame
##D df <- content(ds, "parsed")
##D df
##D 
##D ## use XPath expressions to extract nodes of interest
##D ds['//TaxId/text()']
## End(Not run)



