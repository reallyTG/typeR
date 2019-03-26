library(tcR)


### Name: cosine.similarity
### Title: Set and vector similarity measures.
### Aliases: cosine.similarity similarity tversky.index overlap.coef
###   morisitas.index jaccard.index horn.index

### ** Examples

## Not run: 
##D jaccard.index(1:10, 2:20)
##D a <- length(unique(immdata[[1]][, c('CDR3.amino.acid.sequence', 'V.gene')]))
##D b <- length(unique(immdata[[2]][, c('CDR3.amino.acid.sequence', 'V.gene')]))
##D # Next
##D jaccard.index(a, b, repOverlap(immdata[1:2], .seq = 'aa', .vgene = T))
##D # is equal to
##D repOverlap(immdata[1:2], 'jaccard', seq = 'aa', .vgene = T)
## End(Not run)



