## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold', warnings = FALSE----------------------------------
#install_github("AshwiniKV/visTree")
library(visTree)

## ---- fig.show='hold', warnings = FALSE----------------------------------
data("blsdata")
library(partykit)
library(rpart)
library(colorspace)

## ---- fig.show='hold', echo = FALSE, warnings = FALSE--------------------
#names(blsdata)
names(blsdata)[c(4, 6, 12, 19, 21, 22, 23, 24, 25)]<-c("skcal", "srvgssb", "edeq15", "freqff","resteating", "disinhibition", "hunger", "liking", "wanting")
newblsdata<-blsdata[,c(7,21, 22,23, 24, 25, 26)]

## ---- fig.show='hold'----------------------------------------------------
data("blsdata")

## ---- fig.show='hide', warnings = FALSE, out.width = '90%',fig.align = 'center', fig.height = 9, ,fig.width = 12----
potentialtree<-ctree(kcal24h0~., data = newblsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree,  color.type = 1, alpha = 0.5)

## ---- fig.show='hold', include = FALSE, warnings = FALSE-----------------
blsdataedit<-blsdata[,-7]
blsdataedit$bin<-0
blsdataedit$bin<-cut(blsdata$kcal24h0, unique(quantile(blsdata$kcal24h0)), include.lowest = TRUE, dig.lab = 4)

## ---- fig.show='hide', out.width = '90%',fig.align = 'center', fig.height = 9, ,fig.width = 12,warnings = FALSE----
potentialtree<-ctree(bin~hunger+rrvfood+resteating+liking+wanting+disinhibition, data = blsdataedit, control = ctree_control(mincriterion = 0.85))
visTree(potentialtree, interval = T)

## ---- fig.show='hide', out.width = '95%',fig.align = 'center', fig.height = 9, ,fig.width = 14, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree)

## ---- fig.show='hide', out.width = '98%',fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-rpart(kcal24h0~., data = newblsdata, control = rpart.control(cp = 0.015))
visTree(potentialtree)

## ---- fig.show='hide', out.width = '98%',fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree, text.label = 1.5, text.title = 1.5, text.bar = 1.5, text.axis = 1.5, text.main = 1.5)

## ---- fig.show='hide', out.width = '98%',fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree, add.h.axis = FALSE)
visTree(potentialtree, add.p.axis = FALSE)

## ---- fig.show='hide', out.width = '98%', fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree, text.round= 3, text.bar = 1.1)

## ---- fig.show='hide', out.width = '98%',fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree, alpha = 0.8)
visTree(potentialtree, alpha = 0.3)

## ---- fig.show='hide', out.width = '98%',fig.align = 'center', fig.height = 9, ,fig.width = 16, warnings = FALSE----
potentialtree<-ctree(kcal24h0~skcal+hunger+rrvfood+resteating+liking+wanting+age, data = blsdata, control = ctree_control(mincriterion = 0.95))
visTree(potentialtree, density.line = FALSE)

