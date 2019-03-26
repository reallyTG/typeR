library(eda4treeR)


### Name: Exam3.1
### Title: Data for Example 3.1 from Experimental Design & Analysis for
###   Tree Improvement
### Aliases: Exam3.1

### ** Examples

data(DataExam3.1)
library(tidyverse)

fmtab3.3     <- lm(
   formula     = Ht~Repl*SeedLot
 , data        = DataExam3.1
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
 anova(fmtab3.3)
DataExam3.1 %>%
 dplyr::group_by(SeedLot) %>%
 dplyr::summarize(Mean=mean(Ht),SD=sd(Ht))
 RESFIT <- data.frame(residualvalue=residuals(fmtab3.3),fittedvalue=fitted.values(fmtab3.3))
library(ggplot2)
ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
 geom_point(size=2)+
 labs(x="Residual vs Fitted Values",y="")+
 theme_bw()



