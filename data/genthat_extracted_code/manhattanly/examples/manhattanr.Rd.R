library(manhattanly)


### Name: manhattanr
### Title: Creates a manhattanr object
### Aliases: manhattanr

### ** Examples

# HapMap dataset included in this package already has columns named P, CHR and BP
library(manhattanly)
DT <- manhattanr(HapMap)
class(DT)
head(DT[["data"]])

#include snp and gene information
DT2 <- manhattanr(HapMap, snp = "SNP", gene = "GENE")
head(DT2[["data"]])





