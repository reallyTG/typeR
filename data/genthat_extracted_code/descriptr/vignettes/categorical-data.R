## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, message=FALSE------------------------------------------
library(descriptr)
library(dplyr)

## ----egdata--------------------------------------------------------------
str(mtcarz)

## ----cross---------------------------------------------------------------
ds_cross_table(mtcarz, cyl, gear)

## ----cross_tibble--------------------------------------------------------
ds_twoway_table(mtcarz, cyl, gear)

## ----cross_group, fig.width=7, fig.height=7, fig.align='centre'----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k)

## ----cross_stack, fig.width=7, fig.height=7, fig.align='centre'----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, stacked = TRUE)

## ----cross_prop, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, proportional = TRUE)

## ----ftable--------------------------------------------------------------
ds_freq_table(mtcarz, cyl)

## ----ftable_bar, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_freq_table(mtcarz, cyl)
plot(k)

## ----oway----------------------------------------------------------------
ds_auto_freq_table(mtcarz)

## ----tway----------------------------------------------------------------
ds_auto_cross_table(mtcarz, cyl, gear, am)

