library(MendelianRandomization)


### Name: mr_median
### Title: Median-based method
### Aliases: mr_median mr_median,MRInput-method

### ** Examples

mr_median(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  weighting = "weighted", iterations = 100)
  # iterations is set to 100 to reduce runtime for the mr_median method,
  # 10000 iterations are recommended in practice
mr_median(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  weighting = "simple", iterations = 100)
mr_median(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  weighting = "penalized", iterations = 100)




