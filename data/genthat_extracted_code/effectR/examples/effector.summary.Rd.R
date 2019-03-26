library(effectR)


### Name: effector.summary
### Title: Returns non-redundant sequences from hmm.search or regex.search
###   and generates a motif table
### Aliases: effector.summary
### Keywords: effector regex

### ** Examples

## Not run: 
##D 
##D fasta.file <- system.file("extdata", "test_infestans.fasta", package = "effectR")
##D ORF <- seqinr::read.fasta(fasta.file)
##D REGEX <- regex.search(ORF, motif='RxLR')
##D candidate.rxlr <- hmm.search(original.seq = fasta.file, regex.seq=REGEX, num.threads = 2)
##D effector.summary(candidate.rxlr)
##D # Custom motifs
##D reg.pat <- "^\\w{50,60}[w,v]"
##D REGEX <- regex.search(sequence = ORF, motif = "custom", reg.pat = reg.pat)
##D candidate.custom <- hmm.search(original.seq = fasta.file, regex.seq = REGEX)
##D effector.summary(candidate.custom, motif = "custom", reg.pat = reg.pat)
##D 
## End(Not run)



