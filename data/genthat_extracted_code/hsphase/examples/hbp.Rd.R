library(hsphase)


### Name: hbp
### Title: Haplotype Blocks of Phased Data
### Aliases: hbp
### Keywords: block phase SNP

### ** Examples

sire <- matrix(c(
  0,0,0,0,0,1,                  # Haplotype one of the sire
  0,1,1,1,1,0                   # Haplotype two of the sire
  ), byrow = TRUE, ncol = 6)
  
haplotypeHalfsib <- matrix(c(
  1,0,1,1,1,1,                  # Individual one, haplotype one
  0,1,0,0,0,0,                  # Individual one, haplotype two
  0,1,1,0,1,1,                  # Individual two, haplotype one
  1,0,0,1,0,0                   # Individual two, haplotype two
  ), byrow = TRUE, ncol = 6)    # 0s and 1s are alelle a and b
  
 hbp(haplotypeHalfsib, sire)



