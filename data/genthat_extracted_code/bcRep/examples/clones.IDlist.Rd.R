library(bcRep)


### Name: clones.IDlist
### Title: Match sequence ID's and clone ID's
### Aliases: clones.IDlist

### ** Examples

## Not run: 
##D data(summarytab)
##D data(aaseqtab)
##D clone.table<-clones(summarytab = summarytab, aaseqtab = aaseqtab, useJ = T, 
##D                          dispSeqID = T)
##D 
##D clone.ID<-clones.IDlist(clones.seqID = clone.table$Sequence_IDs, 
##D                         summarytab.seqID = summarytab$Sequence_ID)
## End(Not run)



