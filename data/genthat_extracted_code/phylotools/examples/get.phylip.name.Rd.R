library(phylotools)


### Name: get.phylip.name
### Title: get the names of sequences from a PHYLIP file
### Aliases: get.phylip.name
### Keywords: phylip

### ** Examples


  cat("6 22",
  "seq_1    --TTACAAATTGACTTATTATA",
  "seq_2    GATTACAAATTGACTTATTATA",
  "seq_3    GATTACAAATTGACTTATTATA",
  "seq_5    GATTACAAATTGACTTATTATA",
  "seq_8    GATTACAAATTGACTTATTATA",
  "seq_10   ---TACAAATTGAATTATTATA",
  file = "matk.phy", sep = "\n")
get.phylip.name("matk.phy")
unlink("matk.phy")



