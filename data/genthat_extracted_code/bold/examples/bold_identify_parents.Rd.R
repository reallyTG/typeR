library(bold)


### Name: bold_identify_parents
### Title: Add taxonomic parent names to a data.frame
### Aliases: bold_identify_parents

### ** Examples

## Not run: 
##D df <- bold_identify(sequences = sequences$seq2)
##D 
##D # long format
##D out <- bold_identify_parents(df)
##D str(out)
##D head(out[[1]])
##D 
##D # wide format
##D out <- bold_identify_parents(df, wide = TRUE)
##D str(out)
##D head(out[[1]])
## End(Not run)



