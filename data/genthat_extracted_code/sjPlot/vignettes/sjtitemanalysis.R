## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo=FALSE, message=FALSE, warning=FALSE---------------------------
library(sjPlot)
library(sjmisc)
library(dplyr)
data(efc)
# create data frame with COPE-index scale
mydf <- dplyr::select(efc, contains("cop"))

## ------------------------------------------------------------------------
sjt.itemanalysis(mydf)

## ------------------------------------------------------------------------
# Compute PCA on Cope-Index, and retrieve 
# factor indices for each COPE index variable
factor.groups <- sjt.pca(mydf)$factor.index

## ------------------------------------------------------------------------
sjt.itemanalysis(mydf, factor.groups)

## ------------------------------------------------------------------------
sjt.itemanalysis(mydf, factor.groups, show.shapiro = TRUE, show.kurtosis = TRUE)

