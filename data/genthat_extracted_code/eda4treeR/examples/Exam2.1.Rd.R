library(eda4treeR)


### Name: Exam2.1
### Title: Example 2.1 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam2.1

### ** Examples

data(DataExam2.1)
library(tidyverse)
fmtab2.3  <-
  lm(
  formula     = dbh ~ SeedLot
, data        = DataExam2.1
# , subset
# , weights
# , na.action
, method      = "qr"
, model       = TRUE
, x           = FALSE
, y           = FALSE
, qr          = TRUE
, singular.ok = TRUE
, contrasts   = NULL
)

anova(fmtab2.3)

DataExam2.1 %>%
  dplyr::group_by(SeedLot) %>%
  dplyr::summarize(Mean = mean(dbh), SD = sd(dbh))



