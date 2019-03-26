library(eda4treeR)


### Name: Exam2.2
### Title: Example 2.2 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam2.2

### ** Examples

library(tidyverse)
data(DataExam2.2)
fmtab2.5  <-
 lm(
  formula       = dbh~Blk+SeedLot
  , data        = DataExam2.2
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

anova(fmtab2.5)

DataExam2.2 %>%
  dplyr::group_by(SeedLot) %>%
  dplyr::summarize(Mean=mean(dbh),sd=sd(dbh))




