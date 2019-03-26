## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show = "hold", fig.width = 6, fig.height = 4-------------------
library(tactile)
show.settings()
show.settings(tactile.theme())

## ---- fig.width = 6, fig.height = 4.5------------------------------------
set.seed(0)

## create a plot to demonstrate graphical settings
obj <- xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width, iris,
              type = c("p", "r"), jitter.x = TRUE, jitter.y = TRUE, factor = 5,
              auto.key = list(lines = TRUE, rectangles = TRUE))
obj <- update(obj,
              legend = list(right = list(fun = "draw.colorkey", 
                                         args = list(list(at = 0:100)))))

## draw with default theme
obj

## ---- fig.width = 6, fig.height = 4.5------------------------------------
## draw with tactile.theme()
update(obj, par.settings = tactile.theme())

