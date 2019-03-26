library(LncFinder)


### Name: make_referFreq
### Title: Make Frequencies File for Log.Dist, Euc.Dist, and hexamer score
### Aliases: make_referFreq

### ** Examples

## Not run: 
##D Seqs <- seqinr::read.fasta(file =
##D "http://www.ncbi.nlm.nih.gov/WebSub/html/help/sample_files/nucleotide-sample.txt")
##D 
##D referFreq <- make_referFreq(cds.seq = Seqs, lncRNA.seq = Seqs, k = 6, step = 1,
##D                             alphabet = c("a", "c", "g", "t"), on.orf = TRUE,
##D                             ignore.illegal = TRUE)
## End(Not run)




