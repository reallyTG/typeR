library(eda4treeR)


### Name: Exam4.3
### Title: Example 4.3 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam4.3

### ** Examples

data(DataExam4.3)
library(tidyverse)
library(ggplot2)
fm4.2    <- aov(
 formula     = Percent~Replication +Contcomp + SeedLot + Pretreatment/Contcomp+
               Contcomp /SeedLot + Pretreatment/ Contcomp/SeedLot
 , data      = DataExam4.3
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
 anova(fm4.2)

 DataExam4.3 %>%
   dplyr::group_by(Contcomp) %>%
   dplyr::summarize(Mean=mean(Percent),n=length(Percent))
 DataExam4.3 %>%
   dplyr::group_by(Contcomp,Pretreatment) %>%
   dplyr::summarize(Mean=mean(Percent),n=length(Percent))
 DataExam4.3 %>%
   dplyr::group_by(SeedLot) %>%
   dplyr::summarize(Mean=mean(Percent))
 DataExam4.3 %>%
   dplyr::group_by(Contcomp,SeedLot) %>%
   dplyr::summarize(Mean=mean(Percent))
 DataExam4.3 %>%
   dplyr::group_by(Pretreatment,Contcomp,SeedLot) %>%
   dplyr::summarize(Mean=mean(Percent))
   RESFIT <- data.frame(residualvalue=residuals(fm4.2),fittedvalue=fitted.values(fm4.2))
   ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
     geom_point(size=2)+
     labs(x="Residual vs Fitted Values",y="")+
     theme_bw()


     fm4.4 <- aov(
     formula = Percent~Replication+Pretreatment*SeedLot
     , data     = DataExam4.3
     , subset   = Contcomp=="Treated"
     #, weights
     #, na.action
     , method = "qr"
     , model = TRUE
     , x = FALSE
     , y = FALSE
     , qr = TRUE
     , singular.ok = TRUE
     , contrasts = NULL
     )
     anova(fm4.4)
     DataExam4.3%>%group_by(Pretreatment)%>%summarize(Mean=mean(Percent))
     DataExam4.3%>%group_by(SeedLot)%>%summarize(Mean=mean(Percent))
     DataExam4.3%>%group_by(Pretreatment,SeedLot)%>%summarize(Mean=mean(Percent))




