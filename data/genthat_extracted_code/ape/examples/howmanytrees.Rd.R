library(ape)


### Name: howmanytrees
### Title: Calculate Numbers of Phylogenetic Trees
### Aliases: howmanytrees
### Keywords: arith math

### ** Examples

### Table 3.1 in Felsenstein 2004:
for (i in c(1:20, 30, 40, 50))
  cat(paste(i, howmanytrees(i), sep = "\t"), sep ="\n")
### Table 3.6:
howmanytrees(8, binary = FALSE, detail = TRUE)



