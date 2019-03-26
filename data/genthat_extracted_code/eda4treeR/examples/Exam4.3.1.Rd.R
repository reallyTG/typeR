library(eda4treeR)


### Name: Exam4.3.1
### Title: Example 4.3.1 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam4.3.1

### ** Examples

data(DataExam4.3.1)
library(tidyverse)
library(ggplot2)
fm4.4    <- aov(
 formula     = Percent~Replication+Pretreatment*SeedLot
 , data      = DataExam4.3.1
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
 anova(fm4.4)

 DataExam4.3.1 %>%
   dplyr::group_by(Pretreatment) %>%
   dplyr::summarize(Mean=mean(Percent))

 DataExam4.3.1 %>%
     dplyr::group_by(SeedLot) %>%
     dplyr::summarize(Mean=mean(Percent))

 DataExam4.3.1 %>%
     dplyr::group_by(Pretreatment,SeedLot) %>%
     dplyr::summarize(Mean=mean(Percent))





