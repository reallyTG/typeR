library(ctl)


### Name: scanSD
### Title: scanSD - Analyze the differences in Standard Deviation between
###   genotypes between two traits
### Aliases: scanSD
### Keywords: methods

### ** Examples

  library(ctl)
  data(multitrait)      # Arabidopsis Thaliana (R/qtl cross object)

  sds <- scanSD(pull.geno(multitrait),pull.pheno(multitrait))



