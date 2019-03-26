library(rcompanion)


### Name: pairwiseMcnemar
### Title: Pairwise McNemar and related tests for Cochran Q test post-hoc
### Aliases: pairwiseMcnemar

### ** Examples

### Cochran Q post-hoc example
data(HayleySmith)
library(DescTools)
CochranQTest(Response ~ Practice | Student,
             data = HayleySmith)
HayleySmith$Practice = factor(HayleySmith$Practice,
                          levels = c("MowHeight", "SoilTest",
                                     "Clippings", "Irrigation"))
PT = pairwiseMcnemar(Response ~ Practice | Student,
                     data    = HayleySmith,
                     test    = "exact",
                     method  = "fdr",
                     digits  = 3)
PT
PT = PT$Pairwise
cldList(comparison = PT$Comparison,
        p.value    = PT$p.adjust,
        threshold  = 0.05)
                                                             



