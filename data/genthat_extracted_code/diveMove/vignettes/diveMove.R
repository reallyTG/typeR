## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(strip.white=TRUE, size="relsize{-1}",
               dev="png", resolution=180)

## ----R-opts, echo=FALSE, results="hide"----
options(width=34, digits=4)

## ----startup, results="hide"----
library(diveMove)

## ----eval=FALSE-----------------
#  example(diveMove)

## ----dives-con------------------
fp <- file.path("data", "dives.csv")
sfp <- system.file(fp, package="diveMove")

## ----readin-csv-----------------
srcfn <- basename(sfp)
tdrXcsv <- read.csv(sfp, sep=";")

## ----create-tdr-----------------
ddtt.str <- paste(tdrXcsv$date, tdrXcsv$time)
ddtt <- strptime(ddtt.str,
                 format="%d/%m/%Y %H:%M:%S")
time.posixct <- as.POSIXct(ddtt, tz="GMT")
tdrX <- createTDR(time=time.posixct,
                  depth=tdrXcsv$depth,
                  concurrentData=tdrXcsv[, -c(1:3)],
                  dtime=5, file=srcfn)
## Or a TDRspeed object, since we know we have
## speed measurements:
tdrX <- createTDR(time=time.posixct,
                  depth=tdrXcsv$depth,
                  concurrentData=tdrXcsv[, -c(1:3)],
                  dtime=5, file=srcfn,
                  speed=TRUE)

## ----readin-tdr, eval=FALSE, results="hide"----
#  fp <- file.path("data", "dives.csv")
#  sfp <- system.file(fp, package="diveMove")
#  tdrX <- readTDR(sfp, speed=TRUE, sep=";",
#                  na.strings="", as.is=TRUE)
#  plotTDR(tdrX)

## ----plot-tdr, include=FALSE, eval=TRUE, echo=FALSE, results="hide"----
fp <- file.path("data", "dives.csv")
sfp <- system.file(fp, package="diveMove")
tdrX <- readTDR(sfp, speed=TRUE, sep=";",
                na.strings="", as.is=TRUE)
plotTDR(tdrX, interact=FALSE, cex.lab=1.3)

## ----eval=FALSE-----------------
#  dcalib <- calibrateDepth(tdrX)

## ----eval=FALSE-----------------
#  dcalib <- calibrateDepth(tdrX,
#                           zoc.method="offset",
#                           offset=3)

## ----eval=FALSE-----------------
#  dcalib <- calibrateDepth(tdrX,
#                           zoc.method="filter",
#                           k=c(3, 5760),
#                           probs=c(0.5, 0.02),
#                           na.rm=TRUE)

## ----zoc------------------------
dcalib <- calibrateDepth(tdrX, dive.thr=3,
                         zoc.method="offset",
                         offset=3,
                         descent.crit.q=0.01,
                         ascent.crit.q=0,
                         knot.factor=20)

## ----plot-gross-activity, eval=FALSE----
#  plotTDR(dcalib, concurVars=c("speed", "light"),
#          surface=TRUE)

## ----plot-tdrcalibrate, include=FALSE, eval=TRUE, echo=FALSE, results="hide"----
plotTDR(dcalib, concurVars=c("speed", "light"),
        surface=TRUE, interact=FALSE, cex.lab=1.3)

## ----plot-dive-activity, eval=FALSE----
#  plotTDR(dcalib, diveNo=2:8, what="phases")

## ----plot-tdr-dives, include=FALSE, eval=TRUE, echo=FALSE, results="hide"----
plotTDR(dcalib, diveNo=2:8, what="phases",
        interact=FALSE, cex.lab=1.3,
        depth.lim=c(0, 80))

## ----extract-dive, eval=FALSE----
#  extractDive(dcalib, diveNo=2:8)

## ----tdr-extract----------------
getTDR(dcalib)

## ----grossact1, eval=FALSE------
#  getGAct(dcalib)

## ----grossact2, eval=FALSE------
#  getGAct(dcalib, "phase.id")

## ----diveact-1, eval=FALSE------
#  getDAct(dcalib)

## ----dphaselab1, eval=FALSE-----
#  getDPhaseLab(dcalib)
#  getDPhaseLab(dcalib, 20)

## ----dphaselab2-----------------
dphases <- getDPhaseLab(dcalib, c(100:300))

## ----diveModel, eval=FALSE------
#  plotDiveModel(dcalib, diveNo=260)

## ----plot-dive-model, include=FALSE, eval=TRUE, echo=FALSE, results="hide"----
plotDiveModel(dcalib, diveNo=260)

## ----extractdive----------------
sealX <- extractDive(dcalib, diveNo=c(100:300))
sealX

## ----plot-phases, eval=FALSE----
#  plotTDR(sealX, phaseCol=dphases)

## ----echo=FALSE, results="hide"------------------------------------------------------------------------
options(width=105)

## ----dive-summaries, echo=TRUE, results="markup"-------------------------------------------------------
tdrXSumm1 <- diveStats(dcalib)
names(tdrXSumm1)
tbudget <- timeBudget(dcalib, ignoreZ=TRUE)
head(tbudget, 4)
trip.labs <- stampDive(dcalib, ignoreZ=TRUE)
tdrXSumm2 <- data.frame(trip.labs, tdrXSumm1)
names(tdrXSumm2)

## ----echo=FALSE, results="hide"----
options(width=34, digits=4)

## ----calibrate-speed, eval=FALSE----
#  vcalib <- calibrateSpeed(dcalib, tau=0.1,
#                           contour.level=0.1,
#                           z=1, bad=c(0, 0),
#                           cex.pts=0.2)

## ----plot-speed-calibration, include=FALSE, eval=TRUE, echo=FALSE, results="hide"----
calibrateSpeed(dcalib, tau=0.1,
               contour.level=0.1,
               z=1, bad=c(0, 0),
               cex.pts=0.2)

