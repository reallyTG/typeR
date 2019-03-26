library(effectR)


### Name: regex.search
### Title: Searching for motifs using regular expressions (REGEX)
### Aliases: regex.search
### Keywords: effector regex

### ** Examples

fasta.file <- system.file("extdata", "test_infestans.fasta", package = "effectR")
ORF <- seqinr::read.fasta(fasta.file)
rxlr.cand <- regex.search(ORF)
custom.cand <- regex.search(ORF, motif = "custom", reg.pat ="^\\w{12,60}r\\wlr\\w{6,10}eer")




