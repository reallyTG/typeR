## ----setup, echo = FALSE, message=FALSE----------------------------------

library(knitr)

knitr::opts_chunk$set(echo = TRUE, 
                      warning = FALSE, 
                      message = FALSE, 
                      eval = nzchar(Sys.getenv("EGRET_eval")),
                      fig.width=7, fig.height=7)


## ---- echo = FALSE-------------------------------------------------------
library(EGRET)
library(EGRETci)
load("pairResults2.RData")
load("Chop.OPbase.RData")

## ------------------------------------------------------------------------
bootPairOut2 <- runPairsBoot(eList, 
                             pairResults2, nBoot = 10)

## ----eval=FALSE----------------------------------------------------------
#  plotHistogramTrend(eList, eBoot, caseSetUp = NA,
#                     flux = TRUE, xMin = NA, xMax = NA,
#                     xStep = NA, printTitle = TRUE,
#                     cex.main = 1.1, cex.axis = 1.1,
#                     cex.lab = 1.1, col.fill = "grey", ...)

## ---- echo = FALSE-------------------------------------------------------
load("bootPairOut2.RData")

## ------------------------------------------------------------------------
plotHistogramTrend(eList,bootPairOut2, caseSetUp = NA)
plotHistogramTrend(eList,bootPairOut2, caseSetUp = NA, flux = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  CIAnnualResults <- ciCalculations(eList,
#                                    startSeed = 494817,
#                                    verbose = TRUE, ...)

## ---- echo = FALSE-------------------------------------------------------
load("eListOutChop.RData")

## ---- eval = FALSE-------------------------------------------------------
#  CIAnnualResults <- ciCalculations(eListOut, verbose = FALSE,
#                                    nBoot = 100, blockLength = 200,
#                                    widthCI = 90)

## ------------------------------------------------------------------------
plotConcHistBoot(eListOut, CIAnnualResults)
plotFluxHistBoot(eListOut, CIAnnualResults)

## ---- echo = FALSE-------------------------------------------------------
load("Chop.OPbase.RData")
load("groupResults.RData")
load("bootGroupsOut.RData")

## ---- eval = FALSE-------------------------------------------------------
#  bootGroupsOut <- runGroupsBoot(eList, groupResults, nBoot = 100)

## ----eval=FALSE----------------------------------------------------------
#  plotHistogramTrend(eList, eBoot, flux = TRUE,
#                           xMin = NA, xMax = NA, xStep = NA,
#                           printTitle = TRUE, cex.main = 1.1,
#                           cex.axis = 1.1, cex.lab = 1.1,
#                           col.fill = "grey", ...)

## ---- echo = FALSE-------------------------------------------------------
load("bootGroupsOut.RData")

## ------------------------------------------------------------------------
plotHistogramTrend(eList, bootGroupsOut, 
                   xMin = -30, xMax = 40, xStep = 10)

plotHistogramTrend(eList, bootGroupsOut, 
                   flux=FALSE, xMin = -30, xMax = 40, xStep = 10)

