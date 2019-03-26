library(batch)


### Name: msplit
### Title: Split Vectors for Parallelization
### Aliases: msplit
### Keywords: interface

### ** Examples

  snps <- paste("snp", 1:98, sep="")
  print(snps)
  print(msplit(snps, 10)) ## Splits it into 10 groups



