## ----options, echo=FALSE----------------------------------------------------------------
options(width = 90)

## ----canprot, message=FALSE-------------------------------------------------------------
library(canprot)
data(canprot)

## ----datasets---------------------------------------------------------------------------
datasets <- pdat_CRC()

## ----comptab, message=FALSE-------------------------------------------------------------
comptab <- lapply_canprot(datasets, function(dataset) {
  pdat <- get_pdat(dataset)
  get_comptab(pdat, plot.it=FALSE, mfun="mean")
})

## ----xsummary, results="asis"-----------------------------------------------------------
library(xtable)
xsummary(comptab)

## ----diffplot, fig.width=6, fig.height=6, fig.align="center"----------------------------
col <- rep("black", length(datasets))
# highlight adenoma / normal datasets
col[grepl("=AD", datasets)] <- "red"
diffplot(comptab, col=col)

## ----datasets2--------------------------------------------------------------------------
datasets <- c("JKMF10", "UNS+14", "WKP+14", "MRK+11_AD.NC", "MRK+11_AC.AD", "MRK+11_AC.NC", "JCF+11", "KWA+14")

## ----rankplot, fig.width=10, fig.height=10, message=FALSE, results="hide", out.width=685----
par(mfrow=c(3, 3))
par(xaxs="i", yaxs="i", las=1, mar=c(4, 4, 2, 2), mgp=c(2.6, 1, 0), cex=1)
for(i in seq_along(datasets)) {
  pdat <- get_pdat(datasets[i], basis="QEC4")
  rankplot(pdat, res=50)
  CHNOSZ::label.figure(LETTERS[i], paren=FALSE, font=2, yfrac=0.94)
}
Ehplot()
CHNOSZ::label.figure("I", paren=FALSE, font=2, yfrac=0.94)

