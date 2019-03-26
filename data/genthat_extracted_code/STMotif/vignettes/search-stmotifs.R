## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
source("../R/mainFunction.R")

## ---- echo=FALSE, fig.cap="Blocks creation", out.width = '70%'-----------
knitr::include_graphics("partitioningintoblocks.png")

## ---- echo=FALSE, fig.cap="Combine the spatial-time series into each block", out.width = '70%'----
knitr::include_graphics("combineseries.png")

## ---- echo=TRUE----------------------------------------------------------
head(SearchSTMotifs(STMotif::example_dataset,NormSAX(STMotif::example_dataset,7),3,7,10,10,3,10))

