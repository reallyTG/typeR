library(rif)


### Name: rif_summary
### Title: Summary
### Aliases: rif_summary

### ** Examples

## Not run: 
##D out <- rif_summary("cellular")
##D out$query
##D out$messages
##D out$result$literatureSummary
##D out$result$federationSummary$total
##D out$result$federationSummary$categories
##D head(out$result$federationSummary$results)
##D 
##D head( rif_summary("neuron")$result$federationSummary$results )
##D head(
##D  rif_summary("neuron", expandSynonyms=FALSE)$result$federationSummary$results
##D )
##D head(
##D  rif_summary("neuron", expandAbbrevs=TRUE)$result$federationSummary$results
##D )
##D 
##D rif_summary("cellular", verbose = TRUE)
## End(Not run)



