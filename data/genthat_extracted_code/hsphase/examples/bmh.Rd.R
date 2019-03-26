library(hsphase)


### Name: bmh
### Title: Block Partitioning
### Aliases: bmh
### Keywords: snp halfsib phase

### ** Examples

genotype <- matrix(c(
0,2,1,1,1,
2,0,1,2,2,
2,2,1,0,2,
2,2,1,1,1,
0,0,2,1,0), ncol = 5, byrow = TRUE) 

(result <- bmh(genotype))




