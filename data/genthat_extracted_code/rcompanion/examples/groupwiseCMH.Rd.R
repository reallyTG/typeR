library(rcompanion)


### Name: groupwiseCMH
### Title: Post-hoc tests for Cochran-Mantel-Haenszel test
### Aliases: groupwiseCMH

### ** Examples

### Post-hoc for Cochran-Mantel-Haenszel test
data(AndersonBias)
Table = xtabs(Count ~ Sex + Result + County,
              data=AndersonBias)
ftable(Table)
mantelhaen.test(Table)
groupwiseCMH(Table,
             group   = 3,
             fisher  = TRUE,
             gtest   = FALSE,
             chisq   = FALSE,
             method  = "fdr",
             correct = "none",
             digits  = 3)
                      



