library(crmPack)


### Name: CohortSizeDLT-class
### Title: Cohort size based on number of DLTs
### Aliases: CohortSizeDLT-class .CohortSizeDLT
### Keywords: classes

### ** Examples


# As example, here is the rule for: 
#   having cohort of size 1 until no DLT were observed
#   and having cohort of size 3 as soon as 1 DLT is observed

mySize <- CohortSizeDLT(DLTintervals = c(0, 1),
                        cohortSize = c(1, 3))




