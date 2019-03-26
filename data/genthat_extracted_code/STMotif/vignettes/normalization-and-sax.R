## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
source("../R/mainFunction.R")

## ---- echo=FALSE, fig.cap="SAX Encoding with 3 letters", out.width = '100%'----
knitr::include_graphics("saxencode.png")

## ---- echo=TRUE----------------------------------------------------------
head(STMotif::example_dataset[,1:10])
head(NormSAX(D = STMotif::example_dataset, a = 7)[,1:10])

