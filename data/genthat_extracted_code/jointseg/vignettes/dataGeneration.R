## ---- include=FALSE------------------------------------------------------
library("jointseg")

## ---- include=FALSE------------------------------------------------------
library("knitr")
opts_chunk$set(dev='png', fig.width=5, fig.height=5)
opts_knit$set(eval.after = "fig.cap")

## ------------------------------------------------------------------------
citation("jointseg")

## ---- include=FALSE------------------------------------------------------
library("jointseg")

## ------------------------------------------------------------------------
n <- 1e4                                 ## signal length
bkp <- c(2334, 6121)                     ## breakpoint positions
regions <- c("(1,1)", "(1,2)", "(0,2)")  ## copy number regions

## ------------------------------------------------------------------------
ylims <- cbind(c(0, 5), c(-0.1, 1.1))
colG <- rep("#88888855", n)
hetCol <- "#00000088"

## ------------------------------------------------------------------------
plotFUN <- function(dataSet, tumorFraction) {
    regDat <- acnr::loadCnRegionData(dataSet=dataSet, tumorFraction=tumorFraction)
    sim <- getCopyNumberDataByResampling(n, bkp=bkp,
                                         regions=regions, regData=regDat)
    dat <- sim$profile
    wHet <- which(dat$genotype==1/2)
    colGG <- colG
    colGG[wHet] <- hetCol
    plotSeg(dat, sim$bkp, col=colGG)
}

## ------------------------------------------------------------------------
ds <- "GSE29172"

## ---- fig.cap=paste("Data set", ds, ":", pct, "% tumor cells")-----------
pct <- 1
plotFUN(ds, pct)

## ---- fig.cap=paste("Data set", ds, ":", pct, "% tumor cells (another resampling)")----
plotFUN(ds, pct)

## ---- fig.cap=paste("Data set", ds, ":", pct, "% tumor cells")-----------
pct <- 0.7
plotFUN(ds, pct)

## ---- fig.cap=paste("Data set", ds, ":", pct, "% tumor cells")-----------
pct <- 0.5
plotFUN(ds, pct)

## ------------------------------------------------------------------------
ds <- "GSE11976"

## ------------------------------------------------------------------------
sessionInfo()

