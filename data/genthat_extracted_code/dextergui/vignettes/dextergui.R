## ----setup, include=FALSE, message=FALSE, warning=FALSE------------------
library(knitr)
library(dplyr)
library(dexter)

opts_chunk$set(echo = FALSE,dev='CairoPNG')

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  library(dextergui)
#  dextergui()
#  

## ---- echo=FALSE, message=FALSE, warning=FALSE---------------------------


data.frame(item_id = c('S1DoCurse', 'S1DoScold'), response = c(0,0,1,1,2,2), item_score = c(0,0,1,1,2,2)) %>%
  arrange(item_id, response) %>%
  kable(caption='Standard format, suitable for polytomous and mc items')


## ---- echo=FALSE, out.extra='style="float:left;"'------------------------

data.frame(item_id = c('mcItem_1', 'mcItem_2','mcItem_3'), nOptions = c(3,4,3), key=c('C','A','A')) %>%
  kable(caption='Alternative format, only suitable for mc items')


## ---- echo=FALSE---------------------------------------------------------
verbAggrData[1:8,1:8] %>%
  kable(caption="example response data for the verbal aggression dataset (Vansteelandt, 2000)")

## ---- include=FALSE, message=FALSE---------------------------------------
db = start_new_project(verbAggrRules,':memory:')
add_booklet(db, verbAggrData, "agg")
tia=tia_tables(db)

## ------------------------------------------------------------------------
tia$testStats %>%
  mutate_if(is.double, round, digits=3) %>%
  kable()

## ---- fig.width=5, fig.height=5------------------------------------------
f=fit_inter(db)
plot(f, "S1DoScold", show.observed=TRUE)
close_project(db)

## ------------------------------------------------------------------------
tia$itemStats %>%
  slice(1:10) %>%
  mutate_if(is.double, round, digits=3) %>%
  kable()

