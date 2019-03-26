## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 4
)

## ----ternaryplot1--------------------------------------------------------
library(tactile)
ternaryplot(Or ~ An * Ab, data = feldspar)

## ----ternaryplot2, fig.width = 7-----------------------------------------
ternaryplot(Or ~ An * Ab, groups = Feldspar, data = feldspar,
            auto.key = list(space = "right"),
            par.settings = list(axis.line = list(col = "transparent")))

## ----ternaryplot3, fig.width = 7-----------------------------------------
ternaryplot(Or ~ An * Ab | Feldspar, data = feldspar, density = TRUE)

## ----ternaryplot4, fig.show = "hold"-------------------------------------
ternaryplot(Or ~ An * Ab, response = Pressure, data = feldspar,
            contour = FALSE)
ternaryplot(Or ~ An * Ab, response = Pressure, data = feldspar, region = FALSE)

## ----bubbleplot1, fig.width = 6------------------------------------------
bubbleplot(disp ~ hp * wt, groups = cyl, data = mtcars, auto.key = TRUE)

## ----bubbleplot2, fig.width = 7, fig.height = 3.5------------------------
bubbleplot(disp ~ hp * wt | factor(cyl), data = mtcars, auto.key = TRUE,
           pch = 16, alpha = 0.5, layout = c(3, 1),
           panel = function(x, y, z, ...) {
             panel.lmline(x, y, ...)
             panel.bubbleplot(x, y, z, ...)
           })

