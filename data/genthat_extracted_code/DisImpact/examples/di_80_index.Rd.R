library(DisImpact)


### Name: di_80_index
### Title: Calculate disproportionate impact per the 80% index
### Aliases: di_80_index

### ** Examples

library(dplyr)
data(student_equity)
di_80_index(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame



