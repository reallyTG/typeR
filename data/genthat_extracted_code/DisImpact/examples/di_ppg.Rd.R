library(DisImpact)


### Name: di_ppg
### Title: Calculate disproportionate impact per the percentage point gap
###   (PPG) method.
### Aliases: di_ppg

### ** Examples

library(dplyr)
data(student_equity)
# Vector
di_ppg(success=student_equity$Transfer
  , group=student_equity$Ethnicity) %>% as.data.frame
# Tidy and column reference
di_ppg(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame
# Cohort
di_ppg(success=Transfer, group=Ethnicity, cohort=Cohort
 , data=student_equity) %>%
  as.data.frame
# With custom reference (single)
di_ppg(success=Transfer, group=Ethnicity, reference=0.54
  , data=student_equity) %>%
  as.data.frame
# With custom reference (multiple)
di_ppg(success=Transfer, group=Ethnicity, cohort=Cohort
  , reference=c(0.5, 0.55), data=student_equity) %>%
  as.data.frame
# min_moe
di_ppg(success=Transfer, group=Ethnicity, data=student_equity
  , min_moe=0.02) %>%
  as.data.frame
# use_prop_in_moe
di_ppg(success=Transfer, group=Ethnicity, data=student_equity
  , min_moe=0.02
  , use_prop_in_moe=TRUE) %>%
  as.data.frame



