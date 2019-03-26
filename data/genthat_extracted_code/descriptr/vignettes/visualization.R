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

## ----hist----------------------------------------------------------------
ds_plot_histogram(mtcarz)

## ----density-------------------------------------------------------------
ds_plot_density(mtcarz)

## ----box_single----------------------------------------------------------
ds_plot_box_single(mtcarz)

## ----scatter-------------------------------------------------------------
ds_plot_scatter(mtcarz, mpg, disp, hp)

## ----bar-----------------------------------------------------------------
ds_plot_bar(mtcarz)

## ----bar_stacked---------------------------------------------------------
ds_plot_bar_stacked(mtcarz, cyl, gear, am)

## ----bar_grouped---------------------------------------------------------
ds_plot_bar_grouped(mtcarz, cyl, gear, am)

## ----box_group-----------------------------------------------------------
ds_plot_box_group(mtcarz, cyl, gear, mpg, disp)

