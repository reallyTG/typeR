## ------------------------------------------------------------------------
# From CRAN (Official)
## install.packages('DisImpact')

# From github (Development)
## devtools::install_github('vinhdizzo/DisImpact')

## ---- message=FALSE, warning=FALSE---------------------------------------
library(DisImpact)
library(dplyr) # Ease in manipulations with data frames

## ------------------------------------------------------------------------
# Load fake data set
data(student_equity)

## ------------------------------------------------------------------------
# Summarize toy data
dim(student_equity)
dSumm <- student_equity %>%
  group_by(Cohort, Ethnicity) %>%
  summarize(n=n(), Transfer_Rate=mean(Transfer))
dSumm

## ------------------------------------------------------------------------
# Vector
di_ppg(success=student_equity$Transfer, group=student_equity$Ethnicity) %>% as.data.frame
# Tidy and column reference
di_ppg(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
# Cohort
di_ppg(success=Transfer, group=Ethnicity, cohort=Cohort, data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
di_ppg(success=Transfer_Rate*n, group=Ethnicity, cohort=Cohort, weight=n, data=dSumm) %>%
  as.data.frame

## ------------------------------------------------------------------------
# With custom reference (single)
di_ppg(success=Transfer, group=Ethnicity, reference=0.54, data=student_equity) %>%
  as.data.frame

# With custom reference (multiple)
di_ppg(success=Transfer, group=Ethnicity, cohort=Cohort, reference=c(0.5, 0.55), data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
# min_moe
di_ppg(success=Transfer, group=Ethnicity, data=student_equity, min_moe=0.02) %>%
  as.data.frame
# use_prop_in_moe
di_ppg(success=Transfer, group=Ethnicity, data=student_equity, min_moe=0.02, use_prop_in_moe=TRUE) %>%
  as.data.frame

## ------------------------------------------------------------------------
# Without cohort
## Vector
di_prop_index(success=student_equity$Transfer, group=student_equity$Ethnicity) %>% as.data.frame
## Tidy and column reference
di_prop_index(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame

# With cohort
## Vector
di_prop_index(success=student_equity$Transfer, group=student_equity$Ethnicity, cohort=student_equity$Cohort) %>% as.data.frame
## Tidy and column reference
di_prop_index(success=Transfer, group=Ethnicity, cohort=Cohort, data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
# Without cohort
## Vector
di_80_index(success=student_equity$Transfer, group=student_equity$Ethnicity) %>% as.data.frame
## Tidy and column reference
di_80_index(success=Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame

# With cohort
## Vector
di_80_index(success=student_equity$Transfer, group=student_equity$Ethnicity, cohort=student_equity$Cohort) %>% as.data.frame
## Tidy and column reference
di_80_index(success=Transfer, group=Ethnicity, cohort=Cohort, data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
di_ppg(success=!Transfer, group=Ethnicity, data=student_equity) %>%
  as.data.frame

## ------------------------------------------------------------------------
# Transform success
a <- sample(0:1, size=nrow(student_equity), replace=TRUE, prob=c(0.95, 0.05))
mean(a)
di_ppg(success=pmax(Transfer, a), group=Ethnicity, data=student_equity) %>%
  as.data.frame

# Collapse Black and Hispanic
di_ppg(success=Transfer, group=ifelse(Ethnicity %in% c('Black', 'Hispanic'), 'Black/Hispanic', Ethnicity), data=student_equity) %>% as.data.frame

