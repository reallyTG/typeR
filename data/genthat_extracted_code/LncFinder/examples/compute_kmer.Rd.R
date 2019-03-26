library(LncFinder)


### Name: compute_kmer
### Title: Compute _k_-mer Features
### Aliases: compute_kmer

### ** Examples

## Not run: 
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D kmer_res1 <- compute_kmer(Seqs, k = 1:5, step = 1, freq = TRUE, improved.mode = FALSE)
##D 
##D kmer_res2 <- compute_kmer(Seqs, k = 1:5, step = 3, freq = TRUE,
##D                           improved.mode = TRUE, on.ORF = TRUE, auto.full = TRUE)
## End(Not run)




