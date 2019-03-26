library(bio3d)


### Name: pfam
### Title: Download Pfam FASTA Sequence Alignment
### Aliases: pfam
### Keywords: utilities

### ** Examples

## Not run: 
##D # PFAM server connection required - testing excluded
##D 
##D aln <- pfam("piwi")
##D aln <- pfam("PF02171")
##D 
##D seq <- get.seq("1rx2_A", outfile = tempfile())
##D hmm <- hmmer(seq, type="hmmscan", db="pfam")
##D aln <- pfam(hmm$hit.tbl$acc[1])
##D 
##D # Or much more simply for RCSB PDB entries:
##D acc <- pdb.pfam("1rx2_A", compact=FALSE)$pfamAcc
##D aln <- pfam(acc)
## End(Not run)



