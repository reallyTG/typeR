## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(SCRABBLE)

## ------------------------------------------------------------------------
data_sc <- demo_data[[1]]
data_bulk <- demo_data[[2]]
data_true <- demo_data[[3]]

## ---- fig.height= 3, fig.width= 5----------------------------------------
pl <- list()
pl[[1]] <- plot_data(log10(data_true + 1),"True Data")
pl[[2]] <- plot_data(log10(data_sc + 1),"Drop-out Data")
main <- gridExtra::grid.arrange(grobs = pl,ncol = 2, top = "")

## ------------------------------------------------------------------------
parameter <- c(1,1e-6,1e-4)

## ------------------------------------------------------------------------
result <- scrabble(demo_data, parameter = parameter)

## ---- fig.height = 3, fig.width= 7, fig.wide = TRUE----------------------
pl <- list()
pl[[1]] <- plot_data(log10(demo_data[[3]] + 1),"True Data")
pl[[2]] <- plot_data(log10(demo_data[[1]] + 1),"Drop-out Data")
pl[[3]] <- plot_data(log10(result + 1),"Imputed by SCRABBLE")
main <- gridExtra::grid.arrange(grobs = pl, ncol = 3, top = "")

## ------------------------------------------------------------------------
sessionInfo()

