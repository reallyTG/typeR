library(phylotools)


### Name: read.phylip
### Title: read phylip file
### Aliases: read.phylip
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

res <- read.phylip(infile = "matk.phy")
unlink("matk.phy")



