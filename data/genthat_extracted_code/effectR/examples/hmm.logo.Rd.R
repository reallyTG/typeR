library(effectR)


### Name: hmm.logo
### Title: Plots the relative frequencies of each position for 'hmmsearch'
###   table.
### Aliases: hmm.logo
### Keywords: effector plot regex

### ** Examples

## Not run: 
##D 
##D fasta.file <- system.file("extdata", "test_infestans.fasta", package = "effectR")
##D ORF <- seqinr::read.fasta(fasta.file)
##D REGEX <- regex.search(ORF, motif='RxLR')
##D candidate.rxlr <- hmm.search(original.seq = fasta.file, regex.seq=REGEX, num.threads = 2)
##D hmm.logo(candidate.rxlr$HMM_Table)
## End(Not run)



