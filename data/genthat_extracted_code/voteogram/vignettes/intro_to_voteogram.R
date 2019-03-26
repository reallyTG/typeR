## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libs, message = FALSE, warning = FALSE------------------------------
library(voteogram)
library(ggplot2)

## ----data, eval=FALSE----------------------------------------------------
#  sen <- roll_call("senate", 115, 1, 110)
#  rep <- roll_call("house", 115, 1, 256)

## ----real_data, echo=FALSE-----------------------------------------------
sen <- readRDS(system.file("extdata", "sen.rds", package="voteogram"))
rep <- readRDS(system.file("extdata", "rep.rds", package="voteogram"))

## ------------------------------------------------------------------------
str(sen)

sen$votes

## ------------------------------------------------------------------------
str(rep)

fortify(rep)

## ----sen, fig.width=8, fig.height=5--------------------------------------
senate_carto(sen) +
  labs(title="Senate Vote 110 - Invokes Cloture on Neil Gorsuch Nomination") +
  theme_voteogram()

## ----rep_pp_square, fig.width=8, fig.height=5----------------------------
house_carto(rep, pp_square=TRUE) +
  labs(x=NULL, y=NULL, 
       title="House Vote 256 - Passes American Health Care Act,\nRepealing Obamacare") +
  theme_voteogram()

## ----rep_pp_orig, fig.width=8, fig.height=5------------------------------
house_carto(rep, pp_square=FALSE) +
  labs(x=NULL, y=NULL, 
       title="House Vote 256 - Passes American Health Care Act,\nRepealing Obamacare") +
  theme_voteogram()

## ----rep_gt, fig.width=8, fig.height=5-----------------------------------
house_carto(rep, "gt") +
  labs(x=NULL, y=NULL, 
       title="House Vote 256 - Passes American Health Care Act,\nRepealing Obamacare") +
  theme_voteogram()

## ----sen_small, fig.width=3, fig.height=2.1------------------------------
senate_carto(sen) + theme_voteogram(legend=FALSE)

## ----rep_small, fig.width=3, fig.height=2.1------------------------------
house_carto(rep) + theme_voteogram(legend=FALSE)

## ----rep_small_1, fig.width=3, fig.height=2.1----------------------------
house_carto(rep, pp_square=TRUE) + theme_voteogram(legend=FALSE)

