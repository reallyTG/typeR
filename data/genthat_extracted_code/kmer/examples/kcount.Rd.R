library(kmer)


### Name: kcount
### Title: K-mer counting.
### Aliases: kcount

### ** Examples

  ## compute a matrix of k-mer counts for the woodmouse
  ## data (ape package) using a k-mer size of 3
  library(ape)
  data(woodmouse)
  x <- kcount(woodmouse, k = 3)
  x
  ## 64 columns for nucleotide 3-mers AAA, AAC, ... TTT
  ## convert to AAbin object and repeat the operation
  y <- kcount(ape::trans(woodmouse, 2), k = 2)
  y
  ## 400 columns for amino acid 2-mers AA, AB, ... , YY



