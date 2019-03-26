library(LncFinder)


### Name: compute_hexamerScore
### Title: Compute Hexamer Score
### Aliases: compute_hexamerScore

### ** Examples

## Not run: 
##D Seqs <- seqinr::read.fasta(file =
##D "http://www.ncbi.nlm.nih.gov/WebSub/html/help/sample_files/nucleotide-sample.txt")
##D 
##D referFreq <- make_referFreq(cds.seq = Seqs, lncRNA.seq = Seqs, k = 6, step = 1,
##D                             alphabet = c("a", "c", "g", "t"), on.orf = TRUE,
##D                             ignore.illegal = TRUE)
##D 
##D data(demo_DNA.seq)
##D Sequences <- demo_DNA.seq
##D 
##D hexamerScore <- compute_hexamerScore(Sequences, label = "NonCoding", referFreq = referFreq,
##D                                      k = 6, step = 1, alphabet = c("a", "c", "g", "t"),
##D                                      on.ORF = TRUE, auto.full = TRUE, parallel.cores = 2)
## End(Not run)




