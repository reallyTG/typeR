## ----setup, cache=FALSE, include=FALSE-----------------------------------
library(alluvial)
library(dplyr)

knitr::opts_chunk$set(
  fig.width=7, 
  fig.height=4,
  cache=FALSE
)

## ----data----------------------------------------------------------------
tit <- as.data.frame(Titanic, stringsAsFactors = FALSE)
head(tit)

## ----example-------------------------------------------------------------
alluvial(tit[,1:4], freq=tit$Freq,
         col = ifelse(tit$Survived == "Yes", "orange", "grey"),
         border = ifelse(tit$Survived == "Yes", "orange", "grey"),
         hide = tit$Freq == 0,
         cex = 0.7
)

## ----alluvial_defaults_2-------------------------------------------------
# Survival status and Class
tit %>% group_by(Class, Survived) %>%
  summarise(n = sum(Freq)) -> tit2d

alluvial(tit2d[,1:2], freq=tit2d$n)

## ----alluvial_defaults_3-------------------------------------------------
# Survival status, Sex, and Class
tit %>% group_by(Sex, Class, Survived) %>%
  summarise(n = sum(Freq)) -> tit3d

alluvial(tit3d[,1:3], freq=tit3d$n)

## ----colors--------------------------------------------------------------
alluvial(
  tit3d[,1:3], 
  freq=tit3d$n,
  col = ifelse( tit3d$Sex == "Female", "pink", "lightskyblue"),
  border = "grey",
  alpha = 0.7,
  blocks=FALSE
)

## ----alluvial_hide-------------------------------------------------------
alluvial(tit2d[,1:2], freq=tit2d$n, hide=tit2d$n < 150)

## ------------------------------------------------------------------------
tit2d %>% select(Class, Survived, n) %>%
  filter(n < 150)

## ----data_layer----------------------------------------------------------
d <- data.frame(
  x = c(1, 2, 3),
  y = c(3 ,2, 1),
  freq=c(1,1,1)
)
d

## ----layer_ex1, fig.width=3, fig.height=3, fig.show="hold"---------------
alluvial(d[,1:2], freq=d$freq, col=1:3, alpha=1)
# Reversing the order
alluvial(d[ 3:1, 1:2 ], freq=d$freq, col=3:1, alpha=1)

## ----layer_ex2-----------------------------------------------------------
alluvial(d[,1:2], freq=d$freq, col=1:3, alpha=1, 
         layer=3:1)

## ----layer_ex3-----------------------------------------------------------
alluvial(tit3d[,1:3], freq=tit3d$n, 
         col = ifelse( tit3d$Survived == "Yes", "orange", "grey" ),
         alpha = 0.8,
         layer = tit3d$Survived == "No"
)

## ----ordering_data-------------------------------------------------------
tit %>% group_by(Sex, Age, Survived) %>%
  summarise( n= sum(Freq)) -> x

tit %>% group_by(Survived, Age, Sex) %>%
  summarise( n= sum(Freq)) -> y

## ----ordering_x----------------------------------------------------------
alluvial(x[,1:3], freq=x$n, 
         col = ifelse(x$Sex == "Male", "orange", "grey"),
         alpha = 0.8,
         blocks=FALSE
)

## ----ordering_y----------------------------------------------------------
alluvial(y[,1:3], freq=y$n, 
         # col = RColorBrewer::brewer.pal(8, "Set1"),
         col = ifelse(y$Sex == "Male", "orange", "grey"),
         alpha = 0.8,
         blocks = FALSE,
         ordering = list(
           order(y$Survived, y$Sex == "Male"),
           order(y$Age, y$Sex == "Male"),
           NULL
         )
)

## ------------------------------------------------------------------------
pal <- c("red4", "lightskyblue4", "red", "lightskyblue")

tit %>%
  mutate(
    ss = paste(Survived, Sex),
    k = pal[ match(ss, sort(unique(ss))) ]
  ) -> tit


alluvial(tit[,c(4,2,3)], freq=tit$Freq,
         hide = tit$Freq < 10,
         col = tit$k,
         border = tit$k,
         blocks=FALSE,
         ordering = list(
           NULL,
           NULL,
           order(tit$Age, tit$Sex )

         )
)

## ---- eval=FALSE, echo=FALSE---------------------------------------------
#  d <- expand.grid(a=1:2, b=1:2, c=1:2)
#  d %>%
#    mutate(
#      z=a,
#      n = rep(1, nrow(d))
#    ) -> d
#  
#  alluvial(
#    d[,1:4],
#    freq=d$n,
#    col=RColorBrewer::brewer.pal(8, "Paired"),
#    blocks=FALSE,
#    ordering = list(
#      NULL,
#      NULL,
#      order(d$b),
#      NULL
#    )
#    )

## ----session_info--------------------------------------------------------
sessionInfo()

