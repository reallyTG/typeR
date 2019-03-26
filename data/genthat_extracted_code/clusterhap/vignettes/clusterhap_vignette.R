## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(clusterhap)

## ---- fig.width=8, fig.height=4, fig.show='hold'-------------------------
library(clusterhap)
data("sim_qtl")
clusterhap(sim_qtl, Print=TRUE)

## ---- fig.width=8, fig.height=4, fig.show='hold'-------------------------
data("rice_qtl")
clusterhap(rice_qtl)

