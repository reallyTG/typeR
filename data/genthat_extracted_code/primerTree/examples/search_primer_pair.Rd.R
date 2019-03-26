library(primerTree)


### Name: search_primer_pair
### Title: Automatic primer searching Search a given primer pair,
###   retrieving the alignment results, their product sequences, the
###   taxonomic information for the sequences, a multiple alignment of the
###   products
### Aliases: search_primer_pair

### ** Examples

## Not run: 
##D #simple search
##D mammals_16S = search_primer_pair(name='Mammals 16S',
##D  'CGGTTGGGGTGACCTCGGA', 'GCTGTTATCCCTAGGGTAACT')
##D #returning 1000 alignments, allow up to 3 mismatches in primer
##D mammals_16S = search_primer_pair(name='Mammals 16S',
##D  'CGGTTGGGGTGACCTCGGA', 'GCTGTTATCCCTAGGGTAACT',
##D  num_aligns=1000, total_primer_specificity_mismatch=3)
## End(Not run)



