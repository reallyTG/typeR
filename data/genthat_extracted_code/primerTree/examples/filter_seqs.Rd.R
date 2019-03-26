library(primerTree)


### Name: filter_seqs
### Title: Filter out sequences retrieved by search_primer_pair() that are
###   either too short or too long. The alignment and tree will be
###   recalculated after removing unwanted reads.
### Aliases: filter_seqs filter_seqs.primerTree

### ** Examples

## Not run: 
##D # filter out sequences longer or shorter than desired:
##D mammals_16S_filtered <- filter_seqs(mammals_16S, min_length=131, max_length=156)
## End(Not run)



