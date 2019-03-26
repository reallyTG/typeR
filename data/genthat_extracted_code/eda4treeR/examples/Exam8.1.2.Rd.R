library(eda4treeR)


### Name: Exam8.1.2
### Title: Example 8.1.2 from Experimental Design & Analysis for Tree
###   Improvement
### Aliases: Exam8.1.2

### ** Examples

data(DataExam8.1)
library(tidyverse)
library(emmeans)
  fm8.11 <- aov(formula      =
  Dbh~Country*Province
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
  b<-anova(fm8.11)
     Res                     <- length(b[["Sum Sq"]])
     df                      <- 119
     MSS                     <- 0.1951
     b[["Df"]][Res]          <- df
     b[["Sum Sq"]][Res]      <- MSS*df
     b[["Mean Sq"]][Res]     <- b[["Sum Sq"]][Res]/b[["Df"]][Res]
     b[["F value"]][1:Res-1] <- b[["Mean Sq"]][1:Res-1]/b[["Mean Sq"]][Res]
     b[["Pr(>F)"]][Res-1]     <- df(b[["F value"]][Res-1],b[["Df"]][Res-1],b[["Df"]][Res])
     b
  library(emmeans)
  emmeans::emmeans(fm8.11,specs = "Country")



