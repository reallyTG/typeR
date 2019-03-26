library(phylotools)


### Name: supermat
### Title: Build PHYLIP supermatrix and RAxML partition file using aligned
###   FASTA or PHYLIP files.
### Aliases: supermat
### Keywords: supermatrix fasta phylip partition RAxML

### ** Examples


  cat("6 22",
  "seq_1    --TTACAAATTGACTTATTATA",
  "seq_2    GATTACAAATTGACTTATTATA",
  "seq_3    GATTACAAATTGACTTATTATA",
  "seq_5    GATTACAAATTGACTTATTATA",
  "seq_8    GATTACAAATTGACTTATTATA",
  "seq_10   ---TACAAATTGAATTATTATA",
  file = "matk.phy", sep = "\n")

  cat("5 15",
  "seq_1     GATTACAAATTGACT",
  "seq_3     GATTACAAATTGACT",
  "seq_4     GATTACAAATTGACT",
  "seq_5     GATTACAAATTGACT",
  "seq_8     GATTACAAATTGACT",
  file = "rbcla.phy", sep = "\n")

  cat("5 50",
  "seq_2          GTCTTATAAGAAAGAATAAGAAAG--AAATACAAA-------AAAAAAGA",
  "seq_3          GTCTTATAAGAAAGAAATAGAAAAGTAAAAAAAAA-------AAAAAAAG",
  "seq_5          GACATAAGACATAAAATAGAATACTCAATCAGAAACCAACCCATAAAAAC",
  "seq_8          ATTCCAAAATAAAATACAAAAAGAAAAAACTAGAAAGTTTTTTTTCTTTG",
  "seq_9          ATTCTTTGTTCTTTTTTTTCTTTAATCTTTAAATAAACCTTTTTTTTTTA",
  file = "trn1.phy", sep = "\n")

supermat(infiles = c("matk.phy", "rbcla.phy", "trn1.phy"))
unlink(c("matk.phy", "rbcla.phy", "trn1.phy"))
unlink(c("supermat.out.phy","gene_partition.txt"))

cat(
  ">seq_1",  "--TTACAAATTGACTTATTATA",
  ">seq_2",  "GATTACAAATTGACTTATTATA",
  ">seq_3",  "GATTACAAATTGACTTATTATA",
  ">seq_5",  "GATTACAAATTGACTTATTATA",
  ">seq_8",  "GATTACAAATTGACTTATTATA",
  ">seq_10", "---TACAAATTGAATTATTATA",
  file = "matk.fasta", sep = "\n")

cat(
  ">seq_1", "GATTACAAATTGACT",
  ">seq_3", "GATTACAAATTGACT",
  ">seq_4", "GATTACAAATTGACT",
  ">seq_5", "GATTACAAATTGACT",
  ">seq_8", "GATTACAAATTGACT",
  file = "rbcla.fasta", sep = "\n")

cat(
  ">seq_2", "GTCTTATAAGAAAGAATAAGAAAG--AAATACAAA-------AAAAAAGA",
  ">seq_3", "GTCTTATAAGAAAGAAATAGAAAAGTAAAAAAAAA-------AAAAAAAG",
  ">seq_5", "GACATAAGACATAAAATAGAATACTCAATCAGAAACCAACCCATAAAAAC",
  ">seq_8", "ATTCCAAAATAAAATACAAAAAGAAAAAACTAGAAAGTTTTTTTTCTTTG",
  ">seq_9", "ATTCTTTGTTCTTTTTTTTCTTTAATCTTTAAATAAACCTTTTTTTTTTA",
  file = "trn1.fasta", sep = "\n")

supermat(infiles = c("matk.fasta", "rbcla.fasta", "trn1.fasta"))
unlink(c("matk.fasta", "rbcla.fasta", "trn1.fasta"))

unlink(c("supermat.out.phy","gene_partition.txt"))




