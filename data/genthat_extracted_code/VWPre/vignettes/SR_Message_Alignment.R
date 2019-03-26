## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, warning=FALSE)

## ---- echo=FALSE, eval=TRUE, message=FALSE-------------------------------
library(VWPre)
data(VWdat)

## ---- eval= TRUE, echo=FALSE, results='hide', message=FALSE--------------
library(VWPre)
data(VWdat)
dat0 <- prep_data(data = VWdat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid")
aligndat <- relabel_na(data = dat0, NoIA = 4)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_msg_time(data = aligndat, Msg = "VowelOnset")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
aligned1 <- align_msg(data = aligndat, Msg = "VowelOnset")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_msg_time(data = aligned1, Msg = "VowelOnset")

## ---- eval= FALSE, echo=TRUE, results='asis'-----------------------------
#  MSGTime <- check_msg_time(data = aligned1, Msg = "VowelOnset", ReturnData = TRUE)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
aligned2 <- create_time_series(data = aligned1, Adjust = 0)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_time_series(data = aligned2)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_msg_time(data = aligned2, Msg = "VowelOnset")

