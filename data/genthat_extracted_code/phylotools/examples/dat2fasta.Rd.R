library(phylotools)


### Name: dat2fasta
### Title: Convert and Save sequence data frame to fasta file
### Aliases: dat2fasta
### Keywords: fasta

### ** Examples


cat(
">seq_2", "GTCTTATAAGAAAGAATAAGAAAG--AAATACAAA-------AAAAAAGA",
">seq_3", "GTCTTATAAGAAAGAAATAGAAAAGTAAAAAAAAA-------AAAAAAAG",
">seq_5", "GACATAAGACATAAAATAGAATACTCAATCAGAAACCAACCCATAAAAAC",
">seq_8", "ATTCCAAAATAAAATACAAAAAGAAAAAACTAGAAAGTTTTTTTTCTTTG",
">seq_9", "ATTCTTTGTTCTTTTTTTTCTTTAATCTTTAAATAAACCTTTTTTTTTTA",
file = "trn1.fasta", sep = "\n")

res <- read.fasta("trn1.fasta")
dat2fasta(res)
unlink("trn1.fasta")
unlink("out.fasta")



