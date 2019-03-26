library(bio3d)


### Name: hmmer
### Title: HMMER Sequence Search
### Aliases: hmmer
### Keywords: utilities

### ** Examples

## Not run: 
##D # HMMER server connection required - testing excluded
##D 
##D ##- PHMMER
##D seq <- get.seq("2abl_A", outfile=tempfile())
##D res <- hmmer(seq, db="pdb")
##D 
##D ##- HMMSCAN
##D fam <- hmmer(seq, type="hmmscan", db="pfam")
##D pfam.aln <- pfam(fam$hit.tbl$acc[1])
##D 
##D ##- HMMSEARCH
##D hmm <- hmmer(pfam.aln, type="hmmsearch", db="pdb")
##D unique(hmm$hit.tbl$species)
##D hmm$hit.tbl$acc
##D 
## End(Not run)



