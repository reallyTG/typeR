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

## ----screener------------------------------------------------------------
ds_screener(mtcarz)

## ----summary-------------------------------------------------------------
ds_summary_stats(mtcarz, mpg)

## ----summary2------------------------------------------------------------
ds_summary_stats(mtcarz, mpg, disp)

## ----fcont---------------------------------------------------------------
ds_freq_table(mtcarz, mpg, 4)

## ----fcont_hist, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_freq_table(mtcarz, mpg, 4)
plot(k)

## ----auto-summary--------------------------------------------------------
ds_auto_summary_stats(mtcarz, disp, mpg)

## ----gsummary------------------------------------------------------------
k <- ds_group_summary(mtcarz, cyl, mpg)
k

## ----gsummary_tibble-----------------------------------------------------
k$tidy_stats

## ----gsum_boxplot, fig.width=7, fig.height=7, fig.align='centre'---------
k <- ds_group_summary(mtcarz, cyl, mpg)
plot(k)

## ----auto-group-summary--------------------------------------------------
ds_auto_group_summary(mtcarz, cyl, gear, mpg)

## ----multistats----------------------------------------------------------
ds_tidy_stats(mtcarz, mpg, disp, hp)

## ----mloc----------------------------------------------------------------
ds_measures_location(mtcarz)

## ----mvar----------------------------------------------------------------
ds_measures_variation(mtcarz)

## ----msym----------------------------------------------------------------
ds_measures_symmetry(mtcarz)

## ----mperc---------------------------------------------------------------
ds_percentiles(mtcarz)

## ----mextreme------------------------------------------------------------
ds_extreme_obs(mtcarz, mpg)

