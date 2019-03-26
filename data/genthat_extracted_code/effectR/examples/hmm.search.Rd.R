library(effectR)


### Name: hmm.search
### Title: Searching for motifs using HMM searches
### Aliases: hmm.search
### Keywords: effector regex

### ** Examples


## Not run: 
##D 
##D fasta.file <- system.file("extdata", "test_infestans.fasta", package = "effectR")
##D ORF <- seqinr::read.fasta(fasta.file)
##D REGEX <- regex.search(ORF, motif="RxLR")
##D candidate.rxlr <- hmm.search(original.seq = fasta.file, regex.seq = REGEX,
##D  alignment.file=NULL, save.alignment=T)
##D 
##D # To save the alignment:
##D library(seqinr)
##D write.fasta(sequences = getSequence(candidate.rxlr$Alignment),
##D  names = getName(candidate.rxlr$Alignment),
##D  file.out = "Alin_infestans.fasta", nbchar = 10000)
##D 
##D # To use an alignment file
##D ALIN <- system.file("extdata", "Alin_infestans.fasta", package = "effectR")
##D candidate.rxlr <- hmm.search(original.seq = fasta.file, regex.seq = REGEX,
##D  alignment.file = ALIN)
## End(Not run)



