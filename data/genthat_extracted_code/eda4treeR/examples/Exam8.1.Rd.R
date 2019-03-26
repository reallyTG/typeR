library(eda4treeR)


### Name: Exam8.1
### Title: Example 8.1 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam8.1

### ** Examples

data(DataExam8.1)
library(tidyverse)
library(ggplot2)

fm8.4 <- aov(formula      = 
        Dbh ~ Inoc+Replication+Error(Replication/Inoc)+Inoc*Country*Province
        ,data         = DataExam8.1
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
summary(fm8.4)
DataExam8.1 %>% 
dplyr:: group_by(Inoc) %>%
dplyr:: summarize(Mean=mean(Dbh))

DataExam8.1 %>%
 dplyr::group_by(Country)%>%
 dplyr::summarize(Mean=mean(Dbh))

DataExam8.1 %>%
dplyr::group_by(Country,Province)%>%
dplyr::summarize(Mean=mean(Dbh))
library(dae)
RESFit<-data.frame(fittedvalue=fitted.aovlist(fm8.4),residualvalue=proj(fm8.4)$Within[,"Residuals"])
library(ggplot2)
ggplot(RESFit,aes(x=fittedvalue,y=residualvalue))+
geom_point(size=2)+
labs(x="Residuals vs Fitted Values", y="")+
theme_bw()

fm8.6 <- aov(formula      = 
Dbh ~ Inoc+Replication+Column+Replication/Row+Replication/Column+Province+Inoc/Province
,data         = DataExam8.1
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
summary(fm8.6)



