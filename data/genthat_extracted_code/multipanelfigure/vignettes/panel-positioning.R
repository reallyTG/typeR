## ---- setup, echo = FALSE------------------------------------------------
knitr::opts_chunk$set(error = TRUE)

## ---- figure-------------------------------------------------------------
library(multipanelfigure)
library(grid)
cols <- 4
rows <- 3
figure <- multi_panel_figure(
  width = 135,
  columns = cols,
  height = 100,
  rows = rows)

## ---- rect_grob----------------------------------------------------------
rect_grob <- function()
{
  this_env <- environment(rect_grob)
  assign("current", this_env$current + 1, this_env)
  rectGrob(gp = gpar(fill = rainbow(8)[this_env$current], alpha = 0.5))
}
assign("current", 0, environment(rect_grob))

## ---- panel1_1-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob()))

## ---- panel1_2-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob()))

## ---- panel1.3_3---------------------------------------------------------
(figure %<>% fill_panel(rect_grob(), row = 1:3, column = 3))

## ---- panel1_4-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob()))

## ---- panel2_1-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob()))

## ---- panel2_4-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob(), column = 4))

## ---- panel3_1-----------------------------------------------------------
(figure %<>% fill_panel(rect_grob(), row = 3))

## ---- panel2.3_2.3-------------------------------------------------------
(figure %<>% fill_panel(rect_grob(), column = 2:3, row = 3))

## ---- allow_panel_overwriting--------------------------------------------
(figure %<>% fill_panel(rect_grob(), column = 2:3, row = 3, allow_panel_overwriting = TRUE))

