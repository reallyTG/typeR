library(msaR)


### Name: as.fasta
### Title: as.fasta
### Aliases: as.fasta

### ** Examples

seqfile <- system.file("sequences","AHBA.aln",package="msaR")
as.fasta(seqfile)
help("as.fasta")

if (requireNamespace("Biostrings", quietly = TRUE)) {
   seqs <- Biostrings::readDNAStringSet(seqfile)
   as.fasta(seqs)
}




