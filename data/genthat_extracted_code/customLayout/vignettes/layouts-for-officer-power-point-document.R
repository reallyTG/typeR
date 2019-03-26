## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(customLayout)
library(officer)
library(magrittr)
library(ggplot2)

lay  <- lay_new(matrix(1:4,nc=2),widths=c(3,2),heights=c(2,1))
lay2 <- lay_new(matrix(1:3))
titleLay <- lay_new(1, widths = 1, heights = 1)

lay3   <- lay_bind_col(lay,lay2, widths=c(3,1))
layout <- lay_bind_row(titleLay, lay3, heights = c(1,7))

lay_show(layout)

## ------------------------------------------------------------------------
## create officer layout
offLayout <- phl_layout(layout,
    margins = c(0.25, 0.25, 0.25, 0.25),
    innerMargins = rep(0.15,4))

## ------------------------------------------------------------------------
pptx <- read_pptx() %>%
  add_slide(master = "Office Theme", layout = "Title and Content")

### fill first placeholder

plot1 <- qplot(mpg, wt, data = mtcars)
plot3 <- qplot(mpg, qsec, data = mtcars)
pptx <- phl_with_gg(pptx, offLayout, 2, plot1)
pptx <- phl_with_gg(pptx, offLayout, 4, plot3)

## ------------------------------------------------------------------------
pl5 <- function() {
  par(mar = rep(0.1, 4))
  pie(c(3, 4, 6), col = 2:4)
}
pl6 <- function() {
  par(mar = rep(0.1, 4))
  pie(c(3, 2, 7), col = 2:4 + 3)
}
pl7 <- function() {
  par(mar = rep(0.1, 4))
  pie(c(5, 4, 2), col = 2:4 + 6)
}

pptx <- phl_with_plot(pptx, offLayout, 6, pl5)
pptx <- phl_with_plot(pptx, offLayout, 7, pl6)
pptx <- phl_with_plot(pptx, offLayout, 8, pl7)

## ------------------------------------------------------------------------
pptx <- phl_with_table(pptx, offLayout, 3, head(iris, 2))

## ------------------------------------------------------------------------
pptx <- phl_with_text(pptx, offLayout, 1, "Custom Layout")

style <- fp_text(font.size = 24, color = "red")
pptx  <- phl_with_text(pptx, offLayout, 5, 
          "Lorem ipsum", type = "body", style = style)

## ---- eval=FALSE---------------------------------------------------------
#  file <- tempfile(fileext = ".pptx")
#  print(pptx, file)

## ------------------------------------------------------------------------
library(customLayout)
library(flextable)
library(dplyr)
library(officer)

lay  <- lay_new(matrix(1:4,nc=2),widths=c(3,2),heights=c(2,1))
lay2 <- lay_new(matrix(1:3))
layout   <- lay_bind_col(lay,lay2, widths=c(3,1))
lay_show(layout)


offLayout <- phl_layout(layout,
    margins = c(0.25, 0.25, 0.25, 0.25),
    innerMargins = rep(0.15,4))

pptx <- read_pptx() %>%
  add_slide(master = "Office Theme", layout = "Title and Content")

table <- mtcars %>% 
  group_by(cyl) %>% 
  summarise(Mean =round(mean(qsec), 2))

## ------------------------------------------------------------------------
pptx <- read_pptx() %>%
  add_slide(
    master = "Office Theme",
    layout = "Title and Content")

flTableRaw <- flextable(table)
pptx <- phl_with_flextable(pptx, 
      olay = offLayout, 1, flTableRaw)

## ------------------------------------------------------------------------
pptx <- read_pptx() %>%
  add_slide(
    master = "Office Theme",
    layout = "Title and Content")

flTable <- phl_adjust_table(table, olay = offLayout, id = 1)
pptx <- phl_with_flextable(pptx, 
      olay = offLayout, 1, flTable)

## ------------------------------------------------------------------------
pptx <- read_pptx() %>%
  add_slide(
    master = "Office Theme",
    layout = "Title and Content")

flTable <- phl_adjust_table(table, olay = offLayout, id = 1)

flTable <-  bg(flTable, bg = "#E4C994", part = "header")
flTable <-  bg(flTable, bg = "#333333", part = "body")
flTable <- color(flTable, color = "#E4C994")

pptx <- phl_with_flextable(pptx, 
      olay = offLayout, 1, flTable)

## ---- results='hide'-----------------------------------------------------
pptx <- read_pptx() %>%
  add_slide(
    master = "Office Theme",
    layout = "Title and Content")

lapply(seq_len(length(offLayout)), function(i) {
  tbl <- phl_adjust_table(table, offLayout, i)  
  phl_with_flextable(pptx, olay = offLayout, i, tbl)
  invisible()
})

