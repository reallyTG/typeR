library(LncFinder)


### Name: compute_EucDistance
### Title: Compute Euclidean Distance
### Aliases: compute_EucDistance

### ** Examples

## Not run: 
##D Seqs <- seqinr::read.fasta(file =
##D "http://www.ncbi.nlm.nih.gov/WebSub/html/help/sample_files/nucleotide-sample.txt")
##D 
##D referFreq <- make_referFreq(cds.seq = Seqs, lncRNA.seq = Seqs, k = 6, step = 3,
##D                             alphabet = c("a", "c", "g", "t"), on.orf = TRUE,
##D                             ignore.illegal = TRUE)
##D 
##D data(demo_DNA.seq)
##D Sequences <- demo_DNA.seq
##D 
##D EucDistance <- compute_EucDistance(Sequences, label = "NonCoding", referFreq = referFreq,
##D                                    k = 6, step = 3, alphabet = c("a", "c", "g", "t"),
##D                                    on.ORF = TRUE, auto.full = TRUE, parallel.cores = 2)
## End(Not run)




