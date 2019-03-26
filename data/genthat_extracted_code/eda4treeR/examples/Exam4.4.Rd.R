library(eda4treeR)


### Name: Exam4.4
### Title: Example 4.4 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam4.4

### ** Examples

data(DataExam4.4)
library(tidyverse)
library(ggplot2)
library(dae)

fm4.6    <- aov(
      formula     = Height~Rep+Irrig*Ferti*SeedDLot+Error(Rep/Irrig:Ferti)
    , data        = DataExam4.4
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
 summary(fm4.6)

    DataExam4.4 %>%
      dplyr::group_by(Irrig) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(Ferti) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(SeedDLot) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(Irrig,Ferti) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(Irrig,SeedDLot) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(Ferti,SeedDLot) %>%
      dplyr::summarize(Mean=mean(Height))

    DataExam4.4 %>%
      dplyr::group_by(Irrig,Ferti,SeedDLot) %>%
      dplyr::summarize(Mean=mean(Height))
RESFIT <- data.frame(residualvalue=residuals(fm4.6),fittedvalue=fitted.values(fm4.6))
ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
 geom_point(size=2)+
 labs(x="Residual vs Fitted Values",y="")+
 theme_bw()



