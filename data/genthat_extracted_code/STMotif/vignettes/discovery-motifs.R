## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE---------------------------------------------------------
data <- STMotif::example_dataset[,1:10]
rownames(data) <- c()
head(data)

