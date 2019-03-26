library(DisImpact)


### Name: di_prop_index
### Title: Calculate disproportionate impact per the proportionality index
###   (PI) method.
### Aliases: di_prop_index

### ** Examples

library(dplyr)
data(student_equity)
di_prop_index(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame



