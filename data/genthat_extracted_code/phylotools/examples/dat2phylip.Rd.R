library(phylotools)


### Name: dat2phylip
### Title: Conver the data frame to sequential PHYLIP format file
### Aliases: dat2phylip
### Keywords: phylip

### ** Examples


  cat(
  ">seq_2", "GTCTTATAAGAAAGAATAAGAAAG--AAATACAAA-------AAAAAAGA",
  ">seq_3", "GTCTTATAAGAAAGAAATAGAAAAGTAAAAAAAAA-------AAAAAAAG",
  ">seq_5", "GACATAAGACATAAAATAGAATACTCAATCAGAAACCAACCCATAAAAAC",
  ">seq_8", "ATTCCAAAATAAAATACAAAAAGAAAAAACTAGAAAGTTTTTTTTCTTTG",
  ">seq_9", "ATTCTTTGTTCTTTTTTTTCTTTAATCTTTAAATAAACCTTTTTTTTTTA",
  file = "trn1.fasta", sep = "\n")

res <- read.fasta("trn1.fasta")
dat2phylip(res)
unlink("trn1.fasta")
unlink("out.phy")



