## ----options, echo=FALSE----------------------------------------------------------------
options(width = 90)

## ----canprot, message=FALSE-------------------------------------------------------------
library(canprot)
data(canprot)

## ----datasets---------------------------------------------------------------------------
datasets <- pdat_hypoxia()

## ----comptab, message=FALSE-------------------------------------------------------------
comptab <- lapply_canprot(datasets, function(dataset) {
  pdat <- get_pdat(dataset, "pdat_hypoxia")
  get_comptab(pdat, plot.it=FALSE, mfun="mean")
}, varlist="pdat_hypoxia")

## ----xsummary, results="asis"-----------------------------------------------------------
library(xtable)
xsummary(comptab)

## ----diffplot, fig.width=6, fig.height=6, fig.align="center"----------------------------
col <- rep("black", length(datasets))
col[grepl("ReOx", datasets)] <- "blue"
col[grepl("=SPH", datasets)] <- "red"
col[grepl("=ASC", datasets)] <- "orange"
diffplot(comptab, col=col)

