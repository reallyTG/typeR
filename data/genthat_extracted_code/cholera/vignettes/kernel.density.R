## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(cholera)

## ----fig.width = 5, fig.height = 5, fig.align = "center", echo = TRUE----
snowMap(add.title = FALSE)
addKernelDensity()

## ----fig.width = 5, fig.height = 5, fig.align = "center", echo = TRUE----
snowMap(add.title = FALSE)
addKernelDensity(pump.subset = c(6, 8))

## ----fig.width = 5, fig.height = 5, fig.align = "center", echo = TRUE----
snowMap(add.title = FALSE)
addKernelDensity(pump.select = c(6, 8))

