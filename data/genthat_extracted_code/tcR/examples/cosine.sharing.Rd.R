library(tcR)


### Name: cosine.sharing
### Title: Shared repertoire analysis.
### Aliases: cosine.sharing shared.representation shared.clones.count
###   shared.summary

### ** Examples

## Not run: 
##D # Load the twb data.
##D data(twb)
##D # Create shared repertoire on the twins data using CDR3 amino acid sequences with CDR1-2.
##D twb.shared <- shared.repertoire(twb, 'av', .verbose = T)
##D sh.repr <- shared.representation(twb.shared)
##D sh.repr
##D # Get proportion of represented shared sequences.
##D apply(sh.repr, 2, function (col) col / col[1])
## End(Not run)



