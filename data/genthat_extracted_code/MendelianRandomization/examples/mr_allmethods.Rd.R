library(MendelianRandomization)


### Name: mr_allmethods
### Title: Mendelian randomization estimation using all methods
### Aliases: mr_allmethods mr_allmethods,MRInput-method

### ** Examples

mr_allmethods(mr_input(bx = ldlc, bxse = ldlcse, 
  by = chdlodds, byse = chdloddsse), method="main", iterations = 100)
  # iterations is set to 100 to reduce runtime for the mr_median method,
  # at least 10000 iterations are recommended in practice




