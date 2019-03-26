## ----options, echo=FALSE----------------------------------------------------------------
options(width = 90)

## ----canprot, message=FALSE-------------------------------------------------------------
library(canprot)
data(canprot)

## ----datasets---------------------------------------------------------------------------
datasets <- pdat_pancreatic()

## ----comptab, message=FALSE-------------------------------------------------------------
comptab <- lapply_canprot(datasets, function(dataset) {
  pdat <- get_pdat(dataset, "pdat_pancreatic")
  get_comptab(pdat, plot.it=FALSE, mfun="mean")
}, varlist="pdat_pancreatic")

## ----xsummary, results="asis"-----------------------------------------------------------
library(xtable)
xsummary(comptab)

## ----diffplot, fig.width=6, fig.height=6, fig.align="center"----------------------------
col <- rep("black", length(datasets))
col[grepl("=low", datasets)] <- "red"
diffplot(comptab, col=col)

