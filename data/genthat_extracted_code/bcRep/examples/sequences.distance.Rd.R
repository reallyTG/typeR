library(bcRep)


### Name: sequences.distance
### Title: Dissimilarity/distance indices for sequence data
### Aliases: sequences.distance
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D data(clones.ind)
##D data(clones.allind)
##D dist1<-sequences.distance(sequences = clones.ind$unique_CDR3_sequences_AA, 
##D      method = "levenshtein", divLength=TRUE)
##D dist2<-sequences.distance(sequences = clones.allind$unique_CDR3_sequences_AA, 
##D      groups = clones.allind$individuals, method = "cosine", divLength=FALSE)
## End(Not run)



