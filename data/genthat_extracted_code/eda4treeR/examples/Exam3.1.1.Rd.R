library(eda4treeR)


### Name: Exam3.1.1
### Title: Example 3.1.1 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam3.1.1

### ** Examples


library(tidyverse)
data(DataExam3.1.1)

fm3.8   <-     lm(
   formula     = Mean~Repl+SeedLot
 , data        = DataExam3.1.1
 #, subset
 #, weights
 #, na.action
 , method      = "qr"
 , model       = TRUE
 , x           = FALSE
 , y           = FALSE
 , qr          = TRUE
 , singular.ok = TRUE
 , contrasts   = NULL
  )
anova(fm3.8)
DataExam3.1.1 %>%
 dplyr::group_by(SeedLot) %>%
 dplyr::summarize(Mean=mean(Mean))



