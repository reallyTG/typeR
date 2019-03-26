library(eda4treeR)


### Name: Exam5.2
### Title: Example 5.2 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam5.2

### ** Examples

data(DataExam5.2)
library(tidyverse)
library(ggplot2)

fm5.7 <- aov(formula = height~env*gen
   ,data    = DataExam5.2
   #, subset
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

   anova(fm5.7)


     fm5.9  <-    aov(formula = height~env*gen
     ,data    = DataExam5.2
     #, subset
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
     anova(fm5.9)
     b<-anova(fm5.9)
     Res                     <- length(b[["Sum Sq"]])
     df                      <- 384
     MSS                     <- 964
     b[["Df"]][Res]          <- df
     b[["Sum Sq"]][Res]      <- MSS*df
     b[["Mean Sq"]][Res]     <- b[["Sum Sq"]][Res]/b[["Df"]][Res]
     b[["F value"]][1:Res-1] <- b[["Mean Sq"]][1:Res-1]/b[["Mean Sq"]][Res]
     b[["Pr(>F)"]][Res-1]     <- df(b[["F value"]][Res-1],b[["Df"]][Res-1],b[["Df"]][Res])
     b

     X1<- DataExam5.2 %>%
     group_by(env) %>%
     summarize(SiteMean=mean(height))

     Data5.2new<-merge(DataExam5.2,X1, by.x="env",by.y="env")
     RegCoeff <- function(Data5.2new)
     {
     fm     <- lm(formula = height ~ SiteMean
              ,data    = Data5.2new)
               setNames(data.frame(t(coef(fm)))
              ,c("intercept", "slope"))
      }
     RegCoeff1     <- Data5.2new %>%
     group_by(gen) %>%
     do(RegCoeff(.))
     SeedLot.Mean <- DataExam5.2 %>%
     group_by(gen) %>%
     summarize(mean(height))
     Tab5.14    <- data.frame(RegCoeff1,Mean=SeedLot.Mean$'mean(height)')
     Tab5.14
     ggplot(Tab5.14,aes(x=Mean,y=slope))+
     geom_point(size=2)+
     theme_bw()+
     geom_text(aes(label=gen),hjust=0, vjust=0)+
     labs(x="Seed Lot Mean",y="Regression Coefficient")

     Code<-c("a","a","a","a","b","b","b","b","c","d","d","d","d","e","f","g",
     "h","h","i","i","j","k","l","m","n","n","n","o","p","p","q","r",
     "s","t","t","u","v")
     Tab5.14$Code<-Code
     ggplot(Tab5.14,aes(x=Mean,y=slope))+
     geom_point(size=2)+
     theme_bw()+
     geom_text(aes(label=Code),hjust=-0.5, vjust=-0.5)+
     labs(x="Seed Lot Mean",y="Regression Coefficient")



