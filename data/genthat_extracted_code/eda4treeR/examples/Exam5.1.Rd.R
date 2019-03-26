library(eda4treeR)


### Name: Exam5.1
### Title: Example 5.1 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam5.1

### ** Examples

data(DataExam5.1)
library(tidyverse)
library(ggplot2)

fm5.4 <- lm(formula = Ht~Site*SeedLot
  ,data    = DataExam5.1
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

   anova(fm5.4)


   DataExam5.1 %>%
     dplyr::group_by(Site) %>%
     dplyr::summarize(Mean=mean(Ht))

   DataExam5.1 %>%
     dplyr::group_by(SeedLot) %>%
     dplyr::summarize(Mean=mean(Ht))

     b<-anova(fm5.4)
     Res                     <- length(b[["Sum Sq"]])
     df                      <- 208
     MSS                     <- 1040
     b[["Df"]][Res]          <- df
     b[["Sum Sq"]][Res]      <- MSS*df
     b[["Mean Sq"]][Res]     <- b[["Sum Sq"]][Res]/b[["Df"]][Res]
     b[["F value"]][1:Res-1] <- b[["Mean Sq"]][1:Res-1]/b[["Mean Sq"]][Res]
     b[["Pr(>F)"]][Res-1]     <- df(b[["F value"]][Res-1],b[["Df"]][Res-1],b[["Df"]][Res])
     b
     
     
     RegCoeff <- function(DataExam5.1)
     {
     fm     <- lm(formula = Ht ~ SiteMean
              ,data    = DataExam5.1)
               setNames(data.frame(t(coef(fm)))
              ,c("intercept", "slope"))
      }
   X1       <- DataExam5.1%>%group_by(Site)%>%summarize(sitemean=mean(Ht))
   X2       <- filter(DataExam5.1, SeedLot=="13653")
   X3       <- filter(DataExam5.1, SeedLot=="13871")
  dffig5.1 <-merge(rbind(X2,X3),X1)
  ggplot(dffig5.1, aes(x=sitemean, y=Ht, color=SeedLot, shape=SeedLot)) +
  geom_point() + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)+
  theme_classic()+
  labs(y="Seedlot mean",x="Sitemean")
  
     RegCoeff     <- DataExam5.1 %>%
     group_by(SeedLot) %>%
     do(RegCoeff(.))
     
     SeedLot.Mean <- DataExam5.1 %>%
     group_by(SeedLot) %>%
     summarize(mean(Ht))
     
     Tab5.10    <- data.frame(RegCoeff,Mean=SeedLot.Mean$'mean(Ht)')
     Tab5.10
     ggplot(Tab5.10,aes(x=Mean,y=slope))+
     geom_point(size=2)+
     theme_bw()+
     labs(x="Seed Lot Mean",y="Regression Coefficient")




